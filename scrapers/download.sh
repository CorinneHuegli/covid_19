#!/bin/sh

# This is a simple wrapper around curl or wget, that can also be used to
# save downloaded pages for archival purposes, as well for feeding fake
# (test) data to the scrapers.

# echo "DOWNLOADING:" "$@" >&2

if which curl >/dev/null; then
  # Few sites, like GL, JU, SZ don't like curl, and return 403, or block site completly per-IP.
  # --output -, because curl, doesn't like to pipe binary files sometimes.
  exec curl --silent --output - --user-agent "Mozilla Firefox Mozilla/5.0; openZH covid_19 at github" "$@"
  exit 1
fi

if which wget >/dev/null; then
  # Few sites, like GL, JU, SZ don't like curl, and return 403, or block site completly per-IP.
  exec wget --output-document=- --quiet --user-agent="Mozilla Firefox Mozilla/5.0; openZH covid_19 at github" "$@"
  exit 1
fi

if which GET >/dev/null; then
  # Few sites, like GL, JU, SZ don't like curl, and return 403, or block site completly per-IP.
  exec GET "$@"
  exit 1
fi

echo "$0: No curl, wget or GET found. Install curl (recommended), or wget." >&2
exit 2
