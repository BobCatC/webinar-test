# webinar-test
A test from Webinar company

## Implementation

- `RecordJson` - data model
- `NameIterator` - implements IteratorProtocol and provides sorted by `time` names 
- `iterateOverRecords` - just decodes data and calls `NameIterator` constructor with unsorted array of records
- `iterateOverRecordsSimpl` - decodes data, sorts records by time and returns only names

## Tests

One test for *simple* implementation and 3 tests for implementation with `NameIterator`
