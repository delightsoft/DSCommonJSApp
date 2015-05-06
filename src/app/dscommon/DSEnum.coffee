assert = require('./util').assert
error = require('./util').error

module.exports = class DSEnum

  @addPropType = ((clazz) ->
    clazz.propDSEnum = ((name, valid) ->
      if assert
        error.invalidArg 'name'if !typeof name == 'string'
        error.invalidArg 'valid' if valid && typeof valid != 'function'
      valid = if q = valid then ((value) -> return if (value == null || (typeof value == 'object' && value instanceof DSEnum)) && q(value) then value else undefined)
      else ((value) -> return if value == null || value instanceof DSEnum then value else undefined)
      return clazz.prop {
        name
        type: 'taskRelativeSplit'
        valid
        read: ((v) -> if v != null then new DSEnum(v) else null)
        str: (-> 'split')
        init: null})
    return)

  constructor: ((enums) ->
    if assert
      if arguments.length == 1 && typeof (src = arguments[0]) == 'object' && src.__proto__ == DSEnum::
        undefined
      else if !(typeof enums == 'string')
        error.invalidArg 'enums'
    if arguments.length == 1 && typeof (src = arguments[0]) == 'object' && src.__proto__ == DSEnum::
      @map = _.clone src.map
    else
      @map = map = {}
      if typeof enums == 'string'
        for v in enums.split ','
          map[v.trim()] = true
      @value = (_.sortBy (k for k of map)).join()
    return)

  toString: (-> return @value)

  valueOf: (-> return @value)

  clone: (-> return new DSEnum(@))

  set: ((enumValue, isTrue) ->
    if assert
      if !(typeof enumValue == 'string')
        error.invalidArg 'enumValue'
      if !(typeof isTrue == 'boolean')
        error.invalidArg 'isTrue'
    if isTrue
      if !(map = @map).hasOwnProperty(enumValue)
        map[enumValue] = true
        @value = (_.sortBy (k for k of map)).join()
    else if (map = @map).hasOwnProperty(enumValue)
      delete @map[enumValue]
      @value = (_.sortBy (k for k of map)).join()
    return @)

  get: ((enumValue) ->
    if assert
      if !(typeof enumValue == 'string')
        error.invalidArg 'enumValue'
    return @map.hasOwnProperty(enumValue))

  any: ((map) ->
    for k of map
      return true if @map.hasOwnProperty k
    return false)

  diff: ((src) ->
    if assert
      if !(typeof src == 'object' && src.__proto__ == DSEnum::)
        error.invalidArg 'src'
    srcMap = src.map
    return ("+#{k}" for k of (map = @map) when !srcMap.hasOwnProperty(k))
            .concat ("-#{k}" for k of srcMap when !map.hasOwnProperty(k))
            .join ', ')
