# walle_kit

[![Build Status](https://cloud.drone.io/api/badges/v7lin/walle_kit/status.svg)](https://cloud.drone.io/v7lin/walle_kit)
[![Codecov](https://codecov.io/gh/v7lin/walle_kit/branch/master/graph/badge.svg)](https://codecov.io/gh/v7lin/walle_kit)
[![GitHub Tag](https://img.shields.io/github/tag/v7lin/walle_kit.svg)](https://github.com/v7lin/walle_kit/releases)
[![Pub Package](https://img.shields.io/pub/v/walle_kit.svg)](https://pub.dartlang.org/packages/walle_kit)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/v7lin/walle_kit/blob/master/LICENSE)

flutter版walle多渠道打包工具

## flutter toolkit

* [flutter版微信SDK](https://github.com/v7lin/wechat_kit)
* [flutter版腾讯(QQ)SDK](https://github.com/v7lin/tencent_kit)
* [flutter版新浪微博SDK](https://github.com/v7lin/weibo_kit)
* [flutter版支付宝SDK](https://github.com/v7lin/alipay_kit)
* [flutter版walle渠道打包工具](https://github.com/v7lin/walle_kit)

## dart/flutter 私服

* [simple_pub_server](https://github.com/v7lin/simple_pub_server)

## docs

* [Meituan-Dianping/walle](https://github.com/Meituan-Dianping/walle)
* [v7lin/qihoo360-jiagu-docker](https://github.com/v7lin/qihoo360-jiagu-docker)
* [v7lin/tencentcloud-legu](https://github.com/v7lin/tencentcloud-legu)

## Android

* apply

```groovy
// android/app/build.gradle
apply from: "${rootProject.findProject(":walle_kit").projectDir}/walle_kit.gradle"
```

* without flavors

```groovy
// android/app/build.gradle
walle {
    enabled = true

//    // https://github.com/v7lin/walle-docker
//    jarFile = file('script/walle-cli-all.jar') // 默认：file('script/walle-cli-all.jar')

    qihoo360 {
//        // https://github.com/v7lin/qihoo360-jiagu-docker
//        jiaguJarFile = file('script/jiagu/jiagu.jar') // 默认：file('script/jiagu/jiagu.jar')

        account = 'xxx'
        password = 'xxx'
        channelId = 'qihu360'
    }

    tencent {
//        // https://github.com/v7lin/tencentcloud-legu
//        leguJarFile = file('script/legu-all.jar') // 默认：file('script/legu-all.jar')

        secretId = 'xxx'
        secretKey = 'xxx'
//        region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
        channelId = 'tencent'
    }

    outputDir = file("${project.buildDir}/outputs/apk/walle") // 默认：file("${project.buildDir}/outputs/apk/${flavorName}/${buildType}/walle")
    fileNameFormat = '${appName}-${buildType}-${channelId}.apk' // 默认：'${appName}-${buildType}-${channelId}.apk'
    channelFile = file('channel')
}
```

```groovy
// android/app/build.gradle
android {
    walleConfigs {
        release {
            enabled = true

//            // https://github.com/v7lin/walle-docker
//            jarFile = file('script/walle-cli-all.jar') // 默认：file('script/walle-cli-all.jar')

            qihoo360 {
//                // https://github.com/v7lin/qihoo360-jiagu-docker
//                jiaguJarFile = file('script/jiagu/jiagu.jar') // 默认：file('script/jiagu/jiagu.jar')

                account = 'xxx'
                password = 'xxx'
                channelId = 'qihu360'
            }

            tencent {
//                // https://github.com/v7lin/tencentcloud-legu
//                leguJarFile = file('script/legu-all.jar') // 默认：file('script/legu-all.jar')

                secretId = 'xxx'
                secretKey = 'xxx'
//                region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
                channelId = 'tencent'
            }

            outputDir = file("${project.buildDir}/outputs/apk/walle") // 默认：file("${project.buildDir}/outputs/apk/${flavorName}/${buildType}/walle")
            fileNameFormat = '${appName}-${buildType}-${channelId}.apk' // 默认：'${appName}-${buildType}-${channelId}.apk'
            channelFile = file('channel')
        }
    }
}

walle {
    enabled = false
}
```

* flavors

```groovy
// android/app/build.gradle
android {
    productFlavors {
        prod {
        }
    }

    walleConfigs {
        prod {
            enabled = true

//            // https://github.com/v7lin/walle-docker
//            jarFile = file('script/walle-cli-all.jar') // 默认：file('script/walle-cli-all.jar')

            qihoo360 {
//                // https://github.com/v7lin/qihoo360-jiagu-docker
//                jiaguJarFile = file('script/jiagu/jiagu.jar') // 默认：file('script/jiagu/jiagu.jar')

                account = 'xxx'
                password = 'xxx'
                channelId = 'qihu360'
            }

            tencent {
//                // https://github.com/v7lin/tencentcloud-legu
//                leguJarFile = file('script/legu-all.jar') // 默认：file('script/legu-all.jar')

                secretId = 'xxx'
                secretKey = 'xxx'
//                region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
                channelId = 'tencent'
            }

            outputDir = file("${project.buildDir}/outputs/apk/walle") // 默认：file("${project.buildDir}/outputs/apk/${flavorName}/${buildType}/walle")
            fileNameFormat = '${appName}-${buildType}-${channelId}.apk' // 默认：'${appName}-${buildType}-${channelId}.apk'
            channelFile = file('channel')
        }
    }
}

walle {
    enabled = false
}
```

## iOS

```
# 不支持
```

## Flutter

* snapshot

```yaml
dependencies:
  walle_kit:
    git:
      url: https://github.com/v7lin/walle_kit.git
```

* release

```yaml
dependencies:
  walle_kit: ^${latestTag}
```

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
