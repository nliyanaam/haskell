data Mood = Blah | Woot deriving (Eq, Show)

-- Notes: Error stating "...lacks accompanying binding" means that function is defined but not implemented.

changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood _ = Blah
