import re

R_SIMPLE_VERSION = re.compile(r'\d+(?:[.]\d+)+')
R_MINOR_VERSION_ONLY = re.compile(r'(?<=\D)(\d{2})(?:\.txt)?$')
R_GIT_VERSION = re.compile(r'(?i)git|svn|trunk')
R_HELL = re.compile(r'hellcrawl')
R_BCRAWL = re.compile(r'bcrawl')

def version(path):
  """Return the Crawl version the logfile at path is, or 'any' if unknown.

  >>> version('meta/hellcrawl/logfile')
  'hellcrawl'
  >>> version('meta/bcrawl/logfile')
  'bcrawl'
  """
  def match(r, test=None, transform=None):
    match_object = r.search(path)
    if match_object:
      groups = match_object.groups()
      value = match_object.group() if len(groups) == 0 else groups[0]
      if not test or test(value):
        return transform(value) if transform else value

  def resolve_minor_version(version):
    return '0.' + version.lstrip('0')

#  return (match(R_HELL) or match(R_BCRAWL)
#          or 'any')
  return (match(R_SIMPLE_VERSION) or
          match(R_MINOR_VERSION_ONLY, transform = resolve_minor_version) or
          match(R_GIT_VERSION, transform = lambda g: 'git') or
          match(R_HELL) or match(R_BCRAWL) or
          'any')

if __name__ == "__main__":
  import doctest
  doctest.testmod()
