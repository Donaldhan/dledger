//
// Created by Tyler on 6/26/20.
//

#include <ndn-cxx/security/verification-helpers.hpp>
#include "cert-list.h"

dledger::CertList::CertList(const Config &config) : m_config(config){
}

void dledger::CertList::insert(const security::v2::Certificate& certificate) {
    if (m_revokedCertificates.count(certificate.getFullName()))
        return;
    std::cout << "Insert certificate " << certificate.getName() << std::endl;
    m_peerCertificates[certificate.getIdentity()].push_back(certificate);
}

bool dledger::CertList::verifySignature(const Data& data) const {
    auto identity = data.getName().getPrefix(m_config.peerPrefix.size());
    auto iterator = m_peerCertificates.find(identity);
    if (iterator == m_peerCertificates.cend()) return false;
    for (const auto& cert : iterator->second) {
        if (security::verifySignature(data, cert)) {
            return true;
        }
    }
    return false;
}

bool dledger::CertList::verifyEndorseSignature(const Data& data) const {
    auto identity = data.getName().getPrefix(m_config.peerPrefix.size());
    auto iterator = m_peerCertificates.find(identity);
    if (iterator == m_peerCertificates.cend()) return false;
    for (const auto& cert : iterator->second) {
        if (m_revokedCertificates.count(cert.getFullName())) continue;
        if (security::verifySignature(data, cert)) {
            return true;
        }
    }
    return false;
}

bool dledger::CertList::verifySignature(const Interest& interest) const{
    SignatureInfo info(interest.getName().get(-2).blockFromValue());
    auto identity = info.getKeyLocator().getName().getPrefix(-2);
    auto iterator = m_peerCertificates.find(identity);
    if (iterator == m_peerCertificates.cend()) return false;
    for (const auto& cert : iterator->second) {
        if (m_revokedCertificates.count(cert.getFullName())) continue;
        if (security::verifySignature(interest, cert)) {
            return true;
        }
    }
    return false;
}

Name dledger::CertList::getCertificateNameIdentity(const Name& certificateName) const{
    return certificateName.getPrefix(m_config.peerPrefix.size());
}

void dledger::CertList::revoke(const Name& certificateName) {
    std::cout << "Revoke certificate " << certificateName << std::endl;
    m_revokedCertificates.insert(certificateName);
}

bool dledger::CertList::authorizedToGenerate() const {
    auto iterator = m_peerCertificates.find(m_config.peerPrefix);
    if (iterator == m_peerCertificates.cend()) return false;
    return !iterator->second.empty();
}

void dledger::CertList::setLastCertRecords(const Name& certName, const std::list<Name>& referencedCerts) {
    std::cout << "Register cert record "<< certName << std::endl;
    m_lastCertRecord.push_back(certName);
    for (const auto &c : referencedCerts) {
        m_lastCertRecord.remove(c);
    }
}

const std::list<Name>& dledger::CertList::getLastCertRecords() const{
    return m_lastCertRecord;
}
