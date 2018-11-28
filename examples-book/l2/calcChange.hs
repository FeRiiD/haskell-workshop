-- simple function that takes two arguments: how much is owed and how much is given
-- if you're given enough money, return the difference. else return 0.
calcChangeV1 owed given = if given - owed > 0
                          then given - owed
                          else 0

calcChangeV2 owed given = if change > 0
                          then change
                          else 0
  where change = given - owed

