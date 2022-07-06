# walle_kit

[![Pub Package](https://img.shields.io/pub/v/walle_kit.svg)](https://pub.dev/packages/walle_kit)
[![License](https://img.shields.io/github/license/RxReader/walle_kit)](https://github.com/RxReader/walle_kit/blob/master/LICENSE)

flutter版walle多渠道打包工具

## 相关工具

* [flutter版微信SDK](https://github.com/rxreader/wechat_kit)
* [flutter版腾讯(QQ)SDK](https://github.com/rxreader/tencent_kit)
* [flutter版新浪微博SDK](https://github.com/rxreader/weibo_kit)
* [flutter版支付宝SDK](https://github.com/rxreader/alipay_kit)
* [flutter版walle渠道打包工具](https://github.com/rxreader/walle_kit)

## dart/flutter 私服

* [simple_pub_server](https://github.com/rxreader/simple_pub_server)

## docs

* [Meituan-Dianping/walle](https://github.com/Meituan-Dianping/walle)
* [rxreader/qihoo360-jiagu-docker](https://github.com/rxreader/qihoo360-jiagu-docker)
* [rxreader/tencentcloud-legu](https://github.com/rxreader/tencentcloud-legu)

## Android

> ⚠️ 360让白嫖党使用CLI，可用腾讯乐固加固360渠道包

* apply

```groovy
// android/app/build.gradle
apply from: "${project(":walle_kit").projectDir}/walle_kit_v2.gradle" // 推荐（非cli方式，不支持360加固）
// 或
apply from: "${project(":walle_kit").projectDir}/walle_kit.gradle" // 不推荐（cli方式，支持360加固）
```

* fileNameFormat

```groovy
// appName: 
// projectName: 
// buildType: 
// versionName: 
// versionCode: 
// packageName: 
// flavorName: 
// channelId: 
```

* channelFile
  * [配置文件示例 - channel](example/android/app/channel)
  * [配置文件示例 - channel.json](example/android/app/channel.json)

### walle_kit_v2.gradle

* without flavors

```groovy
// android/app/build.gradle
walle {
    enabled = true

    // [访问管理](https://console.cloud.tencent.com/cam/capi)
    // [移动应用安全](https://console.cloud.tencent.com/ms/reinforce/list)
    tencent {
        secretId = 'xxx'
        secretKey = 'xxx'
//        region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
        channels = ['tencent', 'tencent-alias']
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

            // [访问管理](https://console.cloud.tencent.com/cam/capi)
            // [移动应用安全](https://console.cloud.tencent.com/ms/reinforce/list)
            tencent {
                secretId = 'xxx'
                secretKey = 'xxx'
//                region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
                channels = ['tencent', 'tencent-alias']
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

            // [访问管理](https://console.cloud.tencent.com/cam/capi)
            // [移动应用安全](https://console.cloud.tencent.com/ms/reinforce/list)
            tencent {
                secretId = 'xxx'
                secretKey = 'xxx'
//                region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
                channels = ['tencent', 'tencent-alias']
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

### walle_kit.gradle

* without flavors

```groovy
// android/app/build.gradle
walle {
    enabled = true

//    // https://github.com/rxreader/walle-docker
//    jarFile = file('script/walle-cli-all.jar') // 默认：file('script/walle-cli-all.jar')

    qihoo360 {
//        // https://github.com/rxreader/qihoo360-jiagu-docker
//        jiaguJarFile = file('script/jiagu/jiagu.jar') // 默认：file('script/jiagu/jiagu.jar')

        account = 'xxx'
        password = 'xxx'
        channels = ['qihu360', 'qihu360-alias']
    }

    // [访问管理](https://console.cloud.tencent.com/cam/capi)
    // [移动应用安全](https://console.cloud.tencent.com/ms/reinforce/list)
    tencent {
//        // https://github.com/rxreader/tencentcloud-legu
//        leguJarFile = file('script/legu-all.jar') // 默认：file('script/legu-all.jar')

        secretId = 'xxx'
        secretKey = 'xxx'
//        region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
        channels = ['tencent', 'tencent-alias']
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

//            // https://github.com/rxreader/walle-docker
//            jarFile = file('script/walle-cli-all.jar') // 默认：file('script/walle-cli-all.jar')

            qihoo360 {
//                // https://github.com/rxreader/qihoo360-jiagu-docker
//                jiaguJarFile = file('script/jiagu/jiagu.jar') // 默认：file('script/jiagu/jiagu.jar')

                account = 'xxx'
                password = 'xxx'
                channels = ['qihu360', 'qihu360-alias']
            }

            // [访问管理](https://console.cloud.tencent.com/cam/capi)
            // [移动应用安全](https://console.cloud.tencent.com/ms/reinforce/list)
            tencent {
//                // https://github.com/rxreader/tencentcloud-legu
//                leguJarFile = file('script/legu-all.jar') // 默认：file('script/legu-all.jar')

                secretId = 'xxx'
                secretKey = 'xxx'
//                region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
                channels = ['tencent', 'tencent-alias']
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

//            // https://github.com/rxreader/walle-docker
//            jarFile = file('script/walle-cli-all.jar') // 默认：file('script/walle-cli-all.jar')

            qihoo360 {
//                // https://github.com/rxreader/qihoo360-jiagu-docker
//                jiaguJarFile = file('script/jiagu/jiagu.jar') // 默认：file('script/jiagu/jiagu.jar')

                account = 'xxx'
                password = 'xxx'
                channels = ['qihu360', 'qihu360-alias']
            }

            // [访问管理](https://console.cloud.tencent.com/cam/capi)
            // [移动应用安全](https://console.cloud.tencent.com/ms/reinforce/list)
            tencent {
//                // https://github.com/rxreader/tencentcloud-legu
//                leguJarFile = file('script/legu-all.jar') // 默认：file('script/legu-all.jar')

                secretId = 'xxx'
                secretKey = 'xxx'
//                region = 'ap-guangzhou' // 可选：'ap-guangzhou'、'ap-shanghai'，默认：'ap-guangzhou'
                channels = ['tencent', 'tencent-alias']
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

## Flutter

* snapshot

```yaml
dependencies:
  walle_kit:
    git:
      url: https://github.com/rxreader/walle_kit.git
```

* release

```yaml
dependencies:
  walle_kit: ^${latestTag}
```

## Star History

![stars](https://starchart.cc/rxreader/walle_kit.svg)
