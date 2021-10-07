import 'dart:convert';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:dio/dio.dart';

class Services {
  Dio d = Dio();
  static Map finalData = {};
  static List transactions = [];
  static List holderInformation = [];
  static String name = "";
  static int index = -1;
  getData() async {
    const Base64Codec base64 = Base64Codec();
    var body =
        "eyJhY2NvdW50IjogeyJsaW5rZWRBY2NSZWYiOiAiMWYxZTZmNDAtZTljOS00ZGI3LTlkZTAtMTg5NmY4ZTZjYzMwIiwgIm1hc2tlZEFjY051bWJlciI6ICJYWFhYWFhYMTIzIiwgInR5cGUiOiAiZGVwb3NpdCIsICJ2ZXJzaW9uIjogIjEuMSIsICJ0cmFuc2FjdGlvbnMiOiB7ImVuZERhdGUiOiAiMjAyMS0wNi0xN1QxNDoyNTozMy40NDBaIiwgInN0YXJ0RGF0ZSI6ICIyMDIxLTAxLTExVDExOjM5OjU3LjE1M1oiLCAidHJhbnNhY3Rpb24iOiBbeyJtb2RlIjogIlVQSSIsICJ0eXBlIjogIkRFQklUIiwgInR4bklkIjogIk0zMjU4NzQxIiwgImFtb3VudCI6ICIxMjM5IiwgIm5hcnJhdGlvbiI6ICJVUEkvOTM1MzE0NTYwNzY0L2dldHNpbXBsL3NpbXBsQGF4aXNiYW5rL0F4aXMgQmFuayIsICJyZWZlcmVuY2UiOiAiUkZOMDAwMTMzODMiLCAidmFsdWVEYXRlIjogIjIwMjEtMDQtMDEiLCAiY3VycmVudEJhbGFuY2UiOiAiNjIyODkuMjUiLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNC0wMVQxMzoyMDoxNCswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJERUJJVCIsICJ0eG5JZCI6ICJNNTk1NTU1MzIiLCAiYW1vdW50IjogIjUwMDAiLCAibmFycmF0aW9uIjogIkJJTC9CUEFZLzAwMTk2MjYwODcwMC9NT1RJTEFMIE9TL01PRElSRUNULUIwMjkyNSAiLCAicmVmZXJlbmNlIjogIlJGTjAyMTM0ODA5IiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA0LTA3IiwgImN1cnJlbnRCYWxhbmNlIjogIjY0NDI1LjkxIiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDQtMDdUMjM6MDE6MTgrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTU5ODg0NzUzIiwgImFtb3VudCI6ICI1MDAwIiwgIm5hcnJhdGlvbiI6ICJCSUwvQlBBWS8wMDE5NjI1NTk4OTMvQlNFIElTSVAvQlNFMDAwMDAwMDM0MjYwICIsICJyZWZlcmVuY2UiOiAiUkZOMDIxNDcyMTUiLCAidmFsdWVEYXRlIjogIjIwMjEtMDQtMDgiLCAiY3VycmVudEJhbGFuY2UiOiAiNTk0MjUuOTEiLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNC0wOFQxMjoyMjowNyswNTozMCJ9LCB7Im1vZGUiOiAiT1RIRVJTIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTYwNTQzMTk1IiwgImFtb3VudCI6ICIzMDYyIiwgIm5hcnJhdGlvbiI6ICJDTVMvMDAwNjM0MjY0MDM5L0FEX0xJQ19fNjQ4NjUyNzAyICIsICJyZWZlcmVuY2UiOiAiUkZOMDIxNzIwMjciLCAidmFsdWVEYXRlIjogIjIwMjEtMDQtMDgiLCAiY3VycmVudEJhbGFuY2UiOiAiNTY0NTAuNDciLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNC0wOFQxNDo0NzoxOCswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJERUJJVCIsICJ0eG5JZCI6ICJNNjA4NzI0MTYiLCAiYW1vdW50IjogIjk3NCIsICJuYXJyYXRpb24iOiAiQklML09OTC8wMDE5NjMzNDQ5NzUvRWFzeSBUcmlwIC93d3dlYXNlbXl0cmlwY28vRmwiLCAicmVmZXJlbmNlIjogIlJGTjAyMTg0NDMzIiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA0LTA4IiwgImN1cnJlbnRCYWxhbmNlIjogIjU1NDc2LjQ3IiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDQtMDhUMTQ6NTc6NTMrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTYxMjAxNjM3IiwgImFtb3VudCI6ICIxNTQwOCIsICJuYXJyYXRpb24iOiAiTU1UL0lNUFMvMDA5OTAwMzY0MjYyL0NyZWRpdCBDYXJkL0hERkMgQ1JFREkvSERGQzAiLCAicmVmZXJlbmNlIjogIlJGTjAyMTk2ODM5IiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA0LTA4IiwgImN1cnJlbnRCYWxhbmNlIjogIjQwMDY4LjQ3IiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDQtMDhUMTk6MjU6NDYrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiQ1JFRElUIiwgInR4bklkIjogIk02MTUzMDg1OCIsICJhbW91bnQiOiAiMTAwMDAwIiwgIm5hcnJhdGlvbiI6ICJTQUwgRklOVEVDSCBQUk9EVUNUUyBhbmQgU09MVVRJT05TIE1BUiAyMDIwIiwgInJlZmVyZW5jZSI6ICJSRk4wMjIwOTI0NSIsICJ2YWx1ZURhdGUiOiAiMjAyMS0wNC0wOSIsICJjdXJyZW50QmFsYW5jZSI6ICIxNDAwNjguNDciLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNC0wOVQyMzowOToxNyswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJERUJJVCIsICJ0eG5JZCI6ICJNNjE4NjAwNzkiLCAiYW1vdW50IjogIjE1MDAwIiwgIm5hcnJhdGlvbiI6ICJNTVQvSU1QUy8wMDk5MDAzNTYzMTEvUmVudC9TQUlMQUtTSE1JL0hERkMwMDAwODQ3ICIsICJyZWZlcmVuY2UiOiAiUkZOMDIyMjE2NTEiLCAidmFsdWVEYXRlIjogIjIwMjEtMDQtMDkiLCAiY3VycmVudEJhbGFuY2UiOiAiMTI1MDY4LjQ3IiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDQtMDlUMjM6MTQ6MjgrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTYyMTg5MzAwIiwgImFtb3VudCI6ICIxMjAwMCIsICJuYXJyYXRpb24iOiAiTU1UL0lNUFMvMDA5OTAwMzU1NzEzL0ZvciBjYXIgbG9hbiBFTUkvU0JJTiIsICJyZWZlcmVuY2UiOiAiUkZOMDIyMzQwNTciLCAidmFsdWVEYXRlIjogIjIwMjEtMDQtMDkiLCAiY3VycmVudEJhbGFuY2UiOiAiMTE1MDY4LjQ3IiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDQtMDlUMjM6Mjg6NDIrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTY0MTY0NjI2IiwgImFtb3VudCI6ICIzMDAwMCIsICJuYXJyYXRpb24iOiAiQUNIL0hERkNMVEQvMjUxNDQzMjAzICIsICJyZWZlcmVuY2UiOiAiUkZOMDIzMDg0OTMiLCAidmFsdWVEYXRlIjogIjIwMjEtMDQtMjUiLCAiY3VycmVudEJhbGFuY2UiOiAiNjkzNDMuNDciLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNC0yNVQxNzoxNToxOCswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJERUJJVCIsICJ0eG5JZCI6ICJNNjY0NjkxNzMiLCAiYW1vdW50IjogIjMyOTQiLCAibmFycmF0aW9uIjogIkJJTC9PTkwvMDAxOTczNjg0MzgwL1N0YXRlIEJhbmsvU0JJQ0FSRF9TSUNJODc0L1NCIiwgInJlZmVyZW5jZSI6ICJSRk4wMjM5NTMzNSIsICJ2YWx1ZURhdGUiOiAiMjAyMS0wNS0wMiIsICJjdXJyZW50QmFsYW5jZSI6ICI2NDE5MC45NyIsICJ0cmFuc2FjdGlvblRpbWVzdGFtcCI6ICIyMDIxLTA1LTAyVDIwOjE2OjU0KzA1OjMwIn0sIHsibW9kZSI6ICJGVCIsICJ0eXBlIjogIkRFQklUIiwgInR4bklkIjogIk02NzEyNzYxNSIsICJhbW91bnQiOiAiMjEzOCIsICJuYXJyYXRpb24iOiAiQUNIL1RQIEtvdGFrIExpZmUgSW5zLzE4MjY3NzE4MTYgIiwgInJlZmVyZW5jZSI6ICJSRk4wMjQyMDE0NyIsICJ2YWx1ZURhdGUiOiAiMjAyMS0wNS0wNCIsICJjdXJyZW50QmFsYW5jZSI6ICI2MTk2Mi45NyIsICJ0cmFuc2FjdGlvblRpbWVzdGFtcCI6ICIyMDIxLTA1LTA0VDExOjIyOjU3KzA1OjMwIn0sIHsibW9kZSI6ICJGVCIsICJ0eXBlIjogIkRFQklUIiwgInR4bklkIjogIk02ODQ0NDQ5OSIsICJhbW91bnQiOiAiMjAyNC41NSIsICJuYXJyYXRpb24iOiAiQUNIL1RQIEV4aWRlTGlmZS9JTkdMaWZlLzE4Mjc5MzQ3OTYgIiwgInJlZmVyZW5jZSI6ICJSRk4wMjQ2OTc3MSIsICJ2YWx1ZURhdGUiOiAiMjAyMS0wNS0wNiIsICJjdXJyZW50QmFsYW5jZSI6ICI1OTI0My40MiIsICJ0cmFuc2FjdGlvblRpbWVzdGFtcCI6ICIyMDIxLTA1LTA2VDE1OjE1OjQ1KzA1OjMwIn0sIHsibW9kZSI6ICJGVCIsICJ0eXBlIjogIkNSRURJVCIsICJ0eG5JZCI6ICJNNjg3NzM3MjAiLCAiYW1vdW50IjogIjE1MDAwMCIsICJuYXJyYXRpb24iOiAiU0FMIEZJTlRFQ0ggUFJPRFVDVFMgYW5kIFNPTFVUSU9OUyBBUFIgMjAyMCIsICJyZWZlcmVuY2UiOiAiUkZOMDI0ODIxNzciLCAidmFsdWVEYXRlIjogIjIwMjEtMDUtMDciLCAiY3VycmVudEJhbGFuY2UiOiAiMTU5MjQzLjQyMDAwMDAwMDAxIiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDUtMDdUMTI6MDg6MTkrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTY5NzYxMzgzIiwgImFtb3VudCI6ICI1MDAwIiwgIm5hcnJhdGlvbiI6ICJCSUwvQlBBWS8wMDE5ODIwMzAwNTUvQlNFIElTSVAvQlNFMDAwMDAwMDM0MjYwICIsICJyZWZlcmVuY2UiOiAiUkZOMDI1MTkzOTUiLCAidmFsdWVEYXRlIjogIjIwMjEtMDUtMDkiLCAiY3VycmVudEJhbGFuY2UiOiAiMTQ3ODU3LjQyMDAwMDAwMDAxIiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDUtMDlUMTg6MzM6NTYrMDU6MzAifSwgeyJtb2RlIjogIk9USEVSUyIsICJ0eXBlIjogIkRFQklUIiwgInR4bklkIjogIk03MDA5MDYwNCIsICJhbW91bnQiOiAiMzA2MiIsICJuYXJyYXRpb24iOiAiQ01TLzAwMDY0MTc1NDM2NS9BRF9MSUNfXzY0ODY1MjcwMiAiLCAicmVmZXJlbmNlIjogIlJGTjAyNTMxODAxIiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA1LTA5IiwgImN1cnJlbnRCYWxhbmNlIjogIjE0NDc5NS40MjAwMDAwMDAwMSIsICJ0cmFuc2FjdGlvblRpbWVzdGFtcCI6ICIyMDIxLTA1LTA5VDE5OjEyOjEyKzA1OjMwIn0sIHsibW9kZSI6ICJGVCIsICJ0eXBlIjogIkRFQklUIiwgInR4bklkIjogIk03MDQxOTgyNSIsICJhbW91bnQiOiAiMTIwMDAiLCAibmFycmF0aW9uIjogIk1NVC9JTVBTLzAxMjkyMzgwNzY3MS9Gb3IgQ2FyIExvYW4vU0JJTiIsICJyZWZlcmVuY2UiOiAiUkZOMDI1NDQyMDciLCAidmFsdWVEYXRlIjogIjIwMjEtMDUtMDkiLCAiY3VycmVudEJhbGFuY2UiOiAiMTM1Nzk1LjQyMDAwMDAwMDAxIiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDUtMDlUMjA6MDU6MTIrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTcxMDc4MjY3IiwgImFtb3VudCI6ICI0NzQyIiwgIm5hcnJhdGlvbiI6ICJNTVQvSU1QUy8wMTMwMTkyNzMzMTgvSERGQyBDQyBQTVQvSERGQyBDUkVESS9IREZDMCIsICJyZWZlcmVuY2UiOiAiUkZOMDI1NjkwMTkiLCAidmFsdWVEYXRlIjogIjIwMjEtMDUtMTEiLCAiY3VycmVudEJhbGFuY2UiOiAiMTE1NjU3LjQyIiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDUtMTFUMjI6MTg6MTUrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTcxNDA3NDg4IiwgImFtb3VudCI6ICIxNTAwMCIsICJuYXJyYXRpb24iOiAiTU1UL0lNUFMvMDEzMDE5Mjc1Njg0L1JlbnQgTWF5IDIwMjAvU0FJTEFLU0hNSS9IREYiLCAicmVmZXJlbmNlIjogIlJGTjAyNTgxNDI1IiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA1LTE1IiwgImN1cnJlbnRCYWxhbmNlIjogIjEwMDY1Ny40MiIsICJ0cmFuc2FjdGlvblRpbWVzdGFtcCI6ICIyMDIxLTA1LTE1VDIxOjIwOjM3KzA1OjMwIn0sIHsibW9kZSI6ICJGVCIsICJ0eXBlIjogIkRFQklUIiwgInR4bklkIjogIk03MjA2NTkzMCIsICJhbW91bnQiOiAiMzAwMDAiLCAibmFycmF0aW9uIjogIkFDSC9IREZDTFRELzI1MzkyODQzNiAiLCAicmVmZXJlbmNlIjogIlJGTjAyNjA2MjM3IiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA1LTE5IiwgImN1cnJlbnRCYWxhbmNlIjogIjcwNjAwLjQyIiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDUtMTlUMTk6MjU6MzIrMDU6MzAifSwgeyJtb2RlIjogIk9USEVSUyIsICJ0eXBlIjogIkRFQklUIiwgInR4bklkIjogIk03MzcxMjAzNSIsICJhbW91bnQiOiAiMTIiLCAibmFycmF0aW9uIjogIlBNU0JZIFJFTkVXQUwgUFJFTUlVTSBGWSAyMSAiLCAicmVmZXJlbmNlIjogIlJGTjAyNjY4MjY3IiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA1LTI0IiwgImN1cnJlbnRCYWxhbmNlIjogIjY4NDE1LjQyIiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDUtMjRUMTE6MTM6MjYrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiREVCSVQiLCAidHhuSWQiOiAiTTc0MDQxMjU2IiwgImFtb3VudCI6ICI0MDU4IiwgIm5hcnJhdGlvbiI6ICJCSUwvMDAxOTkyMzU2ODA1L0lDSUNJIEJBTksgQ1JFRElUIENBLzQzMTU4MTAwOTE5OSIsICJyZWZlcmVuY2UiOiAiUkZOMDI2ODA2NzMiLCAidmFsdWVEYXRlIjogIjIwMjEtMDUtMjUiLCAiY3VycmVudEJhbGFuY2UiOiAiNjQzNTcuNDIiLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNS0yNVQxNDoxNzozNyswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJERUJJVCIsICJ0eG5JZCI6ICJNNzUzNTgxNDAiLCAiYW1vdW50IjogIjIxMzgiLCAibmFycmF0aW9uIjogIkFDSC9UUCBLb3RhayBMaWZlIElucy8xODMyMTg5MTM2ICIsICJyZWZlcmVuY2UiOiAiUkZOMDI3MzAyOTciLCAidmFsdWVEYXRlIjogIjIwMjEtMDYtMDMiLCAiY3VycmVudEJhbGFuY2UiOiAiNjExMjUuNDIiLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNi0wM1QxNzoxNzoxOCswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJERUJJVCIsICJ0eG5JZCI6ICJNNzY2NzUwMjQiLCAiYW1vdW50IjogIjIwMjQuNTUiLCAibmFycmF0aW9uIjogIkFDSC9UUCBFeGlkZUxpZmUvSU5HTGlmZS8xODM0MzEwNTAwICIsICJyZWZlcmVuY2UiOiAiUkZOMDI3Nzk5MjEiLCAidmFsdWVEYXRlIjogIjIwMjEtMDYtMDQiLCAiY3VycmVudEJhbGFuY2UiOiAiNTA4NTEuODciLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNi0wNFQxMzoyNjoxMSswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJDUkVESVQiLCAidHhuSWQiOiAiTTc3MzMzNDY2IiwgImFtb3VudCI6ICIxMDAwMDAiLCAibmFycmF0aW9uIjogIlNBTCBGSU5URUNIIFBST0RVQ1RTIGFuZCBTT0xVVElPTlMgTUFZIDIwMjAiLCAicmVmZXJlbmNlIjogIlJGTjAyODA0NzMzIiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA2LTA4IiwgImN1cnJlbnRCYWxhbmNlIjogIjE0MTg1MS44NyIsICJ0cmFuc2FjdGlvblRpbWVzdGFtcCI6ICIyMDIxLTA2LTA4VDE4OjM1OjE0KzA1OjMwIn0sIHsibW9kZSI6ICJGVCIsICJ0eXBlIjogIkRFQklUIiwgInR4bklkIjogIk03Nzk5MTkwOCIsICJhbW91bnQiOiAiMzAwMCIsICJuYXJyYXRpb24iOiAiQklML0JQQVkvMDAyMDAxNTI2NDc4L0JTRSBJU0lQL0JTRTAwMDAwMDAzNDI2MCAiLCAicmVmZXJlbmNlIjogIlJGTjAyODI5NTQ1IiwgInZhbHVlRGF0ZSI6ICIyMDIxLTA2LTExIiwgImN1cnJlbnRCYWxhbmNlIjogIjEzMzg1MS44NyIsICJ0cmFuc2FjdGlvblRpbWVzdGFtcCI6ICIyMDIxLTA2LTExVDA3OjU4OjM2KzA1OjMwIn0sIHsibW9kZSI6ICJPVEhFUlMiLCAidHlwZSI6ICJERUJJVCIsICJ0eG5JZCI6ICJNNzgzMjExMjkiLCAiYW1vdW50IjogIjMwNjIiLCAibmFycmF0aW9uIjogIkNNUy8wMDA2NTE5OTQ0NDYvQURfTElDX182NDg2NTI3MDIgIiwgInJlZmVyZW5jZSI6ICJSRk4wMjg0MTk1MSIsICJ2YWx1ZURhdGUiOiAiMjAyMS0wNi0xMSIsICJjdXJyZW50QmFsYW5jZSI6ICIxMzA3ODkuODciLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNi0xMVQwODowOToxNyswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJERUJJVCIsICJ0eG5JZCI6ICJNNzg2NTAzNTAiLCAiYW1vdW50IjogIjMwMDAwIiwgIm5hcnJhdGlvbiI6ICJBQ0gvSERGQ0xURC8yNTYwNzA4NjYgIiwgInJlZmVyZW5jZSI6ICJSRk4wMjg1NDM1NyIsICJ2YWx1ZURhdGUiOiAiMjAyMS0wNi0xMSIsICJjdXJyZW50QmFsYW5jZSI6ICIxMDA3ODkuODciLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNi0xMVQwOToxMTo0NSswNTozMCJ9LCB7Im1vZGUiOiAiRlQiLCAidHlwZSI6ICJDUkVESVQiLCAidHhuSWQiOiAiTTc4OTc5NTcxIiwgImFtb3VudCI6ICIxNjAzNy4yMiIsICJuYXJyYXRpb24iOiAiTkVGVC1TQklOMTIwMTYzODAwODkyLVBSSU5DSVBBTCBNVVRVQUwgRlVORC0vQVRUTi8vSU5CLTAwMDAwMDM1NTQzNTgwNTM5LVNCSU4wMCIsICJyZWZlcmVuY2UiOiAiUkZOMDI4NjY3NjMiLCAidmFsdWVEYXRlIjogIjIwMjEtMDYtMTMiLCAiY3VycmVudEJhbGFuY2UiOiAiMTE2ODI3LjA5IiwgInRyYW5zYWN0aW9uVGltZXN0YW1wIjogIjIwMjEtMDYtMTNUMDg6MTU6NDgrMDU6MzAifSwgeyJtb2RlIjogIkZUIiwgInR5cGUiOiAiQ1JFRElUIiwgInR4bklkIjogIk03OTMwODc5MiIsICJhbW91bnQiOiAiMTU2OTEuODgiLCAibmFycmF0aW9uIjogIk5FRlQtQ0lUSU4yMDA4MDkwMzg4OS1NT1RJTEFMIE9TV0FMIE1MVElDUCAzNUZVTkQgUkVEIEFDLUFLU0hBWSBLVU1BUjA1OTAwIiwgInJlZmVyZW5jZSI6ICJSRk4wMjg3OTE2OSIsICJ2YWx1ZURhdGUiOiAiMjAyMS0wNi0xNiIsICJjdXJyZW50QmFsYW5jZSI6ICIxMzI1MTguOTciLCAidHJhbnNhY3Rpb25UaW1lc3RhbXAiOiAiMjAyMS0wNi0xNlQwMzo1NDowMCswNTozMCJ9XX0sICJwcm9maWxlIjogeyJob2xkZXJzIjogeyJ0eXBlIjogIlNpbmdsZSIsICJob2xkZXIiOiBbeyJkb2IiOiAiMjQtMDctMTk3MCIsICJwYW4iOiAiQUFBUEwxMjM0QyIsICJuYW1lIjogIlJhbWtyaXNobmEgU2FwYW4iLCAiZW1haWwiOiAicmFtLnNhcGFuQGdtYWlsLmNvbSIsICJtb2JpbGUiOiAiOTE3MjkzOTE5MjMiLCAiYWRkcmVzcyI6ICI0LzEyOTAsIDc4NXRoIENyb3NzLCAxM3JkIE1haW4sIDd0aCBCbG9jaywgQmFuZ2Fsb3JlIC0gNTY5OTExIiwgIm5vbWluZWUiOiAiUkVHSVNURVJFRCIsICJsYW5kbGluZSI6ICIiLCAiY2t5Y0NvbXBsaWFuY2UiOiAidHJ1ZSJ9XX19LCAic3VtbWFyeSI6IHsidHlwZSI6ICJTQVZJTkdTIiwgImJyYW5jaCI6ICJKYXlhbmFnYXIgN3RoIEJsb2NrIiwgInN0YXR1cyI6ICJBQ1RJVkUiLCAicGVuZGluZyI6IHsiYW1vdW50IjogIjAiLCAidHJhbnNhY3Rpb25UeXBlIjogIkRFQklUIn0sICJjdXJyZW5jeSI6ICJJTlIiLCAiZmFjaWxpdHkiOiAiT0QiLCAiaWZzY0NvZGUiOiAiQVBOQjAwMDExNTQiLCAibWljckNvZGUiOiAiNTAwMjQ1NjQ2IiwgImV4Y2hnZVJhdGUiOiAiIiwgIm9wZW5pbmdEYXRlIjogIjA2LTA4LTE5OTkiLCAiZHJhd2luZ0xpbWl0IjogIjAiLCAiY3VycmVudEJhbGFuY2UiOiAiMTAxNjY2LjMzIiwgImN1cnJlbnRPRExpbWl0IjogIjAiLCAiYmFsYW5jZURhdGVUaW1lIjogIjIwMjEtMDYtMjJUMTM6MjA6MDArMDU6MzAifX19";
    var decodeData = base64.decode(body);
    var utfdata = utf8.decode(decodeData);
    finalData = await jsonDecode(utfdata);
    transactions = finalData["account"]["transactions"]["transaction"];
    holderInformation = finalData["account"]["profile"]["holders"]["holder"];
    name = holderInformation[0]["name"];
  }

  static var bankName = "";
  static var bankBranch = "";
  static var bankAddress = "";
  static var bankContact = "";
  static var bankCity = "";
  static var bankDistrict = "";
  static var bankState = "";

  getBank(String ifsc) async {
    if (ifsc == "APNB0001154") {
      bankName = "Apna Bank";
      bankBranch = "Jayanagar 7th Block";
      bankAddress = "Jayanagar 7th Block";
      bankContact = "Not Available";
      bankCity = "Bangalore";
      bankDistrict = "Bangalore";
      bankState = "Karnataka";
    } else {
      var baseUrl = "https://ifsc.razorpay.com/";
      var finalUrl = baseUrl + ifsc;
      final http.Response response = await http.get(
        Uri.parse(finalUrl),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        bankName = data["BANK"];
        bankBranch = data["BRANCH"];
        bankAddress = data["ADDRESS"];
        bankContact = data["CONTACT"];
        bankCity = data["CITY"];
        bankDistrict = data["DISTRICT"];
        bankState = data["STATE"];
      }
    }
  }

  static bool loginDone = false;
  static bool loginErorr = false;

  login(String username, String password) async {
    var url = "https://fastapi-auth.infinityplus.repl.co/auth/jwt/login";

    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    final body = {
      "username": username,
      "password": password,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
      loginDone = true;
      // print(response.body);
    } else if (response.statusCode == 422) {
      loginErorr = true;
      // print(response.body);
    }
  }

  static bool registerDone = false;
  static bool regiterError = false;

  register(String phoneNum, String password, String email) async {
    var url = "https://fastapi-auth.infinityplus.repl.co/auth/register";

    var headers = {'Content-Type': 'application/json'};

    final body = {
      "email": email,
      "password": password,
      "phone": phoneNum,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: headers,
    );
    if (response.statusCode == 201) {
      registerDone = true;
    } else if (response.statusCode == 400) {
      regiterError = true;
    }
  }

  static List scopes = [];

  createConsent(String phoneNumber, List scopes, String redirectUrl) async {
    var timeStamp = DateFormat('y-MM-ddTHH:mm:ss').format(DateTime.now()) + "Z";

    var url = "https://horizonmoney.infinityplus.repl.co/flows/consent/create";

    var headers = {'Content-Type': 'application/json'};

    final body = {
      "phone_number": phoneNumber,
      "timestamp": timeStamp,
      "scopes": scopes,
      "redirectURL": redirectUrl,
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
    } else {}
  }

  checkConsentStatus(String consentHandel) async {
    var url = "https://horizonmoney.infinityplus.repl.co/flows/consent/check";

    var headers = {'Content-Type': 'application/json'};

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
    } else {}
  }

  fetchSignedData(String consentId) async {
    var url = "https://horizonmoney.infinityplus.repl.co/flows/consent/fetch";

    var headers = {'Content-Type': 'application/json'};

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
    } else {}
  }

  genrateKeyMaterial() async {
    var url =
        "https://horizonmoney.infinityplus.repl.co/flows/data/generateKey";

    var headers = {'Content-Type': 'application/json'};

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
    } else {}
  }

  requestFiData(
      int keyMaterial, String consentId, String digitalSignature) async {
    var url =
        "https://horizonmoney.infinityplus.repl.co/flows/data/requestData";

    var headers = {'Content-Type': 'application/json'};

    final body = {
      "keyMaterial": keyMaterial,
      "consent_id": consentId,
      "digital_signature": digitalSignature,
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
    } else {}
  }

  fetchFidData(String consentId) async {
    var url = "https://horizonmoney.infinityplus.repl.co/flows/data/fetchData";

    var headers = {'Content-Type': 'application/json'};

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
    } else {}
  }

  decryptFiData(
    String base64Data,
    String base64RemoteNonce,
    String base64YourNonce,
    String ourPrivatekey,
    String cryptoAlg,
    String nonce,
  ) async {
    var url =
        "https://horizonmoney.infinityplus.repl.co/flows/data/decryptData";

    var headers = {'Content-Type': 'application/json'};

    final body = {
      "base64data": base64Data,
      "base64RemoteNonce": base64RemoteNonce,
      "base64YourNonce": base64YourNonce,
      "ourPrivatekey": ourPrivatekey,
      "remoteKeyMaterial": {
        "cryptoAlg": cryptoAlg,
        "Nonce": nonce,
      }
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 200) {
    } else {}
  }

  setuAaHealthCheck() async {
    var url = "https://horizonmoney.infinityplus.repl.co/heartbeat";

    var headers = {'Content-Type': 'application/json'};

    final http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    if (response.statusCode == 200) {
    } else {}
  }

  static Uri shortUrl = Uri();

  getReturnUrl() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://horizonmoney.page.link',
      link: Uri.parse('https://horizonmoney.page.link/login'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.android',
        minimumVersion: 0,
      ),
    );

    // final Uri dynamicUrl = await parameters.buildUrl();
    final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
    shortUrl = shortDynamicLink.shortUrl;
  }

  void initDynamicLinks(BuildContext context) async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        Navigator.pushNamed(context, deepLink.path);
      }
    }, onError: (OnLinkErrorException e) async {
      // print('onLinkError');
      // print(e.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }
}
