# zos repro repo

The test script has hardcoded addresses, so it should run afresh each time

- `npm run dev-net` in one window
- `test.sh` in another window


Observe in truffle console

```
Error: Returned error: VM Exception while processing transaction: revert Cannot call fallback function from the proxy admin
```
