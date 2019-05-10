ELM_STATIC = node_modules/.bin/elmstatic
SERVE = node_modules/.bin/serve
WATCH = node_modules/.bin/chokidar
ELM = node_modules/.bin/elm

.PHONY: all site serve test

test:
	make -j2 serve watch
serve: ${SERVE} site
	npx serve _site
watch: ${WATCH} site
	npx chokidar . -d 1000 -s -i "elm.js" -i "elm-stuff/**/*" -i ".git/" -i "_site/**/*" -c elmstatic --initial
site: ${ELM_STATIC} ${ELM}
	npx elmstatic
${ELM_STATIC} ${SERVE} ${WATCH} ${ELM}:
	npm install
	npm audit fix
