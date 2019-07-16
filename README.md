# bazel-demo

Start watching for main app target that relies on the external workspace
```
cd main
ibazel build //app:ts_lib
```

Result:
- If we update `main/app/index.ts` `ibazel` will rebuild `//app:ts_lib`.
- If we update `external/module/hello.ts` nothing will happen.

Expected result:
- If we update `main/app/index.ts` `ibazel` should rebuild `//app:ts_lib`.
- If we update `external/module/hello.ts` `ibazel` should rebuild `//app:ts_lib`.
