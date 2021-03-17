package com.example.reporting_system

import io.flutter.embedding.android.FlutterActivity
import android.content.Context;
import android.os.Bundle;
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant;

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
       // super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        //  MultiDex.install(this)
}
}
