#!/bin/bash

npm run clean
rm zos.json
rm zos.dev*
rm .zos.session


./node_modules/.bin/zos init zos-repro-repo --no-interactive
./node_modules/.bin/zos add Organization
./node_modules/.bin/zos add Directory
# npm run dev-net
./node_modules/.bin/zos session --network development --from 0x87265a62c60247f862b9149423061b36b460f4BB --expires 3600 --no-interactive
./node_modules/.bin/zos push --network development
./node_modules/.bin/zos publish --network development
./node_modules/.bin/zos create Directory --network development --init initialize --args 0x87265a62c60247f862b9149423061b36b460f4BB,0xAd84405aeF5d241E1BB264f0a58E238e221d70dE
./node_modules/.bin/truffle exec truffle-script.js --network development
