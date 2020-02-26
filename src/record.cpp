#include "dledger/record.hpp"
#include <sstream>

namespace dledger {

Record::Record(const std::shared_ptr<Data>& data)
  : m_data(data)
{}

Record::Record(ndn::Data data)
  : m_data(std::make_shared<ndn::Data>(std::move(data)))
{}

std::string
Record::getPayload() const
{
  return "";
}

std::string
Record::getRecordName() const
{
  return "";
}

std::vector<std::string>
getPrecedingRecords(const Record& record)
{
  // record content:
  // [precedingRecord]:[precedingRecord]:...\n
  // ==start==\n
  // [content]\n
  // ==end==\n
  // producer-cert-record-id
  auto contentStr = ndn::encoding::readString(record.m_data->getContent());
  std::istringstream iss(contentStr);
  std::string line;
  std::getline(iss, line);

  std::vector<std::string> precedingRecords;
  std::string delimiter = ":";
  size_t last = 0;
  size_t next = 0;
  while ((next = line.find(delimiter, last)) != std::string::npos) {
    precedingRecords.push_back(line.substr(last, next-last));
    last = next + 1;
  }
  precedingRecords.push_back(line.substr(last));
  return precedingRecords;
}

} // namespace DLedger