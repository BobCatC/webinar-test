# webinar-test
A test from Webinar company

## Implementation

- `RecordJson` - data model
- `NameIterator` - implements IteratorProtocol and provides sorted by `time` names 
- `iterateOverRecords` - just decodes data and calls `NameIterator` constructor with unsorted array of records

## Tests

Just one simple test with generation a batch of records and passing it to `iterateOverRecords` function
