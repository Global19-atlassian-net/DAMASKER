project(
  'damasker',
  'c',
  version : '0.0.1',
  default_options : [
    'buildtype=release',
    'warning_level=3',
    'c_std=gnu11',
    'b_ndebug=false'],
  license : 'BSD-3',
  meson_version : '>= 0.46.0')

############
# CXXFLAGS #
############

damasker_flags = []
cc = meson.get_compiler('c')
foreach cflag: [
  '-Wno-unused-result',
  '-Wno-pointer-arith',
  '-fno-strict-aliasing']
    if cc.has_argument(cflag)
      damasker_flags += cflag
    endif
endforeach

################
# dependencies #
################

# libm
damasker_m_dep = cc.find_library('m', required : false)

# threads
damasker_thread_dep = dependency('threads', required : true)

# dazzdb
damasker_dazzdb_dep = dependency('dazzdb', fallback : ['dazzdb', 'dazzdb_dep'])

# daligner
damasker_daligner_dep = dependency('daligner', fallback : ['daligner', 'daligner_dep'])

damasker_deps = [damasker_m_dep, damasker_thread_dep, damasker_dazzdb_dep, damasker_daligner_dep]

############
# binaries #
############

damasker_exes = [
  ['datander', files(['DB.c', 'tandem.c'])],
  ['TANmask', ['DB.c']],
  ['REPmask', ['DB.c']],
  ['HPC.TANmask', []],
  ['HPC.REPmask', []]]

foreach i : damasker_exes
  executable(
    i[0],
    files([i[0] + '.c']) + i[1],
    dependencies : damasker_deps,
    install : true,
    c_args : damasker_flags)
endforeach
