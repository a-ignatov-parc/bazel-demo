import os from 'os';
import hello from 'bazel_demo_external/module/hello';

hello(os.userInfo().username);
