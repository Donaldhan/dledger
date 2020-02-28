#ifndef DLEDGER_INCLUDE_RECORD_H_
#define DLEDGER_INCLUDE_RECORD_H_

#include <set>
#include <vector>
#include <list>
#include <ndn-cxx/data.hpp>

using namespace ndn;
namespace dledger {

class RecordHeader
{
public:
  RecordHeader() = default;
  RecordHeader(std::list<Name> recordPointers);

  void
  wireEncode(Block& block) const;

  const std::list<Name>&
  wireDecode(const Block& dataContent);

  void
  addPointer(const Name& pointer) {
    m_recordPointers.push_back(pointer);
  };

private:
  const static uint8_t T_RecordHeader = 129;
  std::list<Name> m_recordPointers;
};

class RecordContent
{
public:
  RecordContent() = default;
  RecordContent(std::list<std::string> contentItems);

  void
  wireEncode(Block& block) const;

  const
  std::list<std::string>& wireDecode(const Block& dataContent);

  void
  addContentItem(const std::string& contentItem) {
    m_contentItems.push_back(contentItem);
  };

private:
  const static uint8_t T_RecordContent = 130;
  const static uint8_t T_ContentItem = 131;
  std::list<std::string> m_contentItems;
};

class Record
{
public:
  Record();

  // only used to generate a record before adding to the ledger
  void
  addRecordItem(const std::string& recordItem) {
    m_content.addContentItem(recordItem);
  };

  // only used to parse a record returned from the ledger
  std::string
  getRecordName() const;

  // only used to parse a record returned from the ledger
  const std::list<std::string>&
  getRecordItems() const;

private:
  // supposed to be used by the Ledger class only
  Record(const std::shared_ptr<Data>& data);
  Record(Data data);

  // supposed to be used by the Ledger class only
  const std::list<Name>&
  getPointersFromHeader() const;

  // supposed to be used by the Ledger class only
  void
  addPointer(const Name& pointer) {
    m_header.addPointer(pointer);
  };

  void
  wireEncode(Block& block) const {
    m_header.wireEncode(block);
    m_content.wireEncode(block);
  }

private:
  std::shared_ptr<const Data> m_data;
  RecordHeader m_header;
  RecordContent m_content;
  // std::vector<std::string> m_precedingRecords;
  // std::set<std::string> m_approvers;
  friend class LedgerImpl;
};

} // namespace dledger

#endif // define DLEDGER_INCLUDE_RECORD_H_

