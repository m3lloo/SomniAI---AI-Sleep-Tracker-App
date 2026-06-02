plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.flutterdev"
    compileSdk = 36
    ndkVersion = "28.2.13676358"
    // NOTE: kept for dependency compatibility


    compileOptions {
        isCoreLibraryDesugaringEnabled = true
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    tasks.withType<JavaCompile>().configureEach {
        options.compilerArgs.add("-Xlint:-options")
    }

    defaultConfig {
        applicationId = "com.example.flutterdev"
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        vectorDrawables.useSupportLibrary = true
    }

    buildTypes {
        release {
            // Use explicit release signing if configured; fall back to debug for local builds
            signingConfig = signingConfigs.findByName("release") ?: signingConfigs.getByName("debug")
            // Consider enabling minification and resource shrinking for production builds
            isMinifyEnabled = false // set true and configure ProGuard/R8 when ready
            isShrinkResources = false
        }
    }

    packagingOptions {
        exclude("META-INF/proguard/androidx-*.pro")
    }

    lint {
        disable += listOf(
            "MissingDimensionBaselineCheck",
            "MissingDimensionBaselineCheckOnly",
            "DimensionMissingFromColorDrawableItem"
        )
        checkReleaseBuilds = false
    }

    buildFeatures {
        resValues = true
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
    implementation("com.google.android.material:material:1.12.0")
    implementation("androidx.appcompat:appcompat:1.7.0")
    implementation("androidx.core:core:1.13.1")
}
