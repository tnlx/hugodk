# -------------------------------------
# Works on a copy of the source code
# -------------------------------------

cp -r /src/. .

for f in /entrypoint.d/*.sh; do
    # Prevents exec "*.sh" if there is no script found.
    [ -f "$f" ] || break
    . $f
done

hugo $@
