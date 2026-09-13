  @Test
  func testRejectsTruncatedWideEnum() throws {
    var truncatedBuffer = ByteBuffer(bytes: Array(repeating: 0, count: 17))
    var truncatedVerifier = try Verifier(buffer: &truncatedBuffer)

    #expect(throws: FlatbuffersErrors.outOfBounds(position: 24, end: 17)) {
      try MyGame_Example_LongEnum.verify(
        &truncatedVerifier,
        at: 16,
        of: MyGame_Example_LongEnum.self)
    }

    var validBuffer = ByteBuffer(bytes: Array(repeating: 0, count: 24))
    var validVerifier = try Verifier(buffer: &validBuffer)
    try MyGame_Example_LongEnum.verify(
      &validVerifier,
      at: 16,
      of: MyGame_Example_LongEnum.self)
  }

