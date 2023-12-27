package com.example.flutter_spg_java;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import java.util.Map;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import sharepay.paylibrary.BaseCallbackBean;
import sharepay.paylibrary.SarawakAPI;
import sharepay.paylibrary.SarawakPay;
import sharepay.paylibrary.SarawakPayCallback;

public class MainActivity extends FlutterActivity implements SarawakPayCallback {
    private static final String CHANNEL = "com.example.flutter_spg_java/main";
    private SarawakAPI mFactory;
    private String data = "";
    private Result resultDelegate;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        final Context delegate = this;
        super.onCreate(savedInstanceState);

//        GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));
//        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
//            @Override
//            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//                resultDelegate = result;
//                final Map<String, Object> arguments = methodCall.arguments();
//
//                if (methodCall.method.equals("spayPlaceOrder")) {
//                    String dataString = (String) arguments.get("dataString");
//
//                    data = dataString;
//
//                    sendRequest();
//                }
//            }
//        });

        configureFlutterEngine(new FlutterEngine(this));

        mFactory = SarawakPay.createFactory(delegate);
    }

    public void configureFlutterEngine(FlutterEngine flutterEngine) {
//        GeneratedPluginRegistrant.registerWith(flutterEngine);
        new MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(new
           MethodChannel.MethodCallHandler() {
               @Override
               public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                   resultDelegate = result;
                   final Map<String, Object> arguments = call.arguments();

                   if (call.method.equals("spayPlaceOrder")) {
                       String dataString = (String) arguments.get("dataString");
                       data = dataString;
                       sendRequest();
                   }
               }
           });
    }

    public void openWebPage(String url) {
        System.out.println("Exec openWebPage..");
        System.out.println(url);
        Uri webpage = Uri.parse(url);
        Intent intent = new Intent(Intent.ACTION_VIEW, webpage);
        if (intent.resolveActivity(getPackageManager()) != null) {
            startActivity(intent);
        }
    }

    public void sendRequest() {
        System.out.println("Exec sendRequest..");
        System.out.println(data);
        mFactory.sendReq(data, this);
    }

    @Override
    public void payResult(BaseCallbackBean baseCallbackBean) {
        System.out.println("Exec Override..");
        System.out.println(baseCallbackBean.getFlag());
        resultDelegate.success(baseCallbackBean.getFlag());
    }

    @Override
    protected void onDestroy() {
        System.out.println("Exec onDestroy..");
        super.onDestroy();
        if (mFactory != null) {
            mFactory.onDestroy();
        }
    }
}