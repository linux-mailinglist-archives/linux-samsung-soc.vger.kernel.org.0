Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6A3B67E4F4
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Jan 2023 13:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbjA0MTX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Jan 2023 07:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232080AbjA0MTG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 07:19:06 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F02981B18
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 04:15:39 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id B01C484EEF;
        Fri, 27 Jan 2023 13:14:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1674821697;
        bh=ss2MqIY1vFLwQEWWjsXEVezBnSUVGIRGPjrbXX3WzyI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jrt3q3t+ZHCxlX2iyvlWpvdr02BmnzGC8zfgPvxzSqHy//ZL7DqnViRVnXDAza4TH
         W+/RqMr5XYXcAdGtRancTZbr7K1TUwpbJBMzEheQCGx+IiBTkTh1GHzVjPEaJ/iVz8
         jhy6wvZTyUCfaqR4pAOtWIm/NwPNo/3KRRbTNRh99T2gSShPor62Uzxfh8MKvgacno
         EAsmFLorzIWt/bkLug5I5Xbe4zgYqX5zdn33qFDvs6TK7GZhBegoSLoAEN04AQSoou
         4erVzxyCvqGWhphSx87zh0cfUbtTpTYnD2cJS+8Wr9jo/0EClkgZtcdTvUmmJDnMci
         ud66tRAgKxfwA==
Content-Type: multipart/mixed; boundary="------------g08fYK75NVO0I8Y99d04itGS"
Message-ID: <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
Date:   Fri, 27 Jan 2023 12:30:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Laurent.pinchart@ideasonboard.com, aford173@gmail.com,
        andrzej.hajda@intel.com, dri-devel@lists.freedesktop.org,
        frieder.schrempf@kontron.de, inki.dae@samsung.com,
        kyungmin.park@samsung.com, linux-amarula@amarulasolutions.com,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com,
        matteo.lisi@engicam.com, sw0312.kim@samsung.com,
        tharvey@gateworks.com
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is a multi-part message in MIME format.
--------------g08fYK75NVO0I8Y99d04itGS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/23 12:04, Jagan Teki wrote:
> On Fri, Jan 27, 2023 at 4:26 PM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
>>
>> On 27/01/2023 11.39, Jagan Teki wrote:
>>> On Fri, Jan 27, 2023 at 4:03 PM Rasmus Villemoes
>>> <rasmus.villemoes@prevas.dk> wrote:
>>>>
>>>> Hi Jagan and others
>>>>
>>>> I'm trying to test this series on our imx8mp-based boards, which has the
>>>> mipi-dsi connected to a ti,sn65dsi86 bridge (in turn connected to a
>>>> full-size DP-connector). But I don't know how to add the proper nodes to
>>>> imx8mp.dtsi. My current, obviously incomplete, attempt is
>>>
>>> Please use this repo - https://github.com/openedev/kernel/tree/imx8mm-dsi-v12
>>
>> Thanks, but that's exactly what I'm doing, and I don't see any
>> modification of imx8mp.dtsi in that branch. I'm basically looking for
>> help to do the equivalent of
>>
>>    88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>>    f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>>
>> for imx8mp in order to test those patches on our boards (we have two
>> variants).
> 
> Marek, any help here, thanks.

Try attached patch.
--------------g08fYK75NVO0I8Y99d04itGS
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-arm64-dts-imx8mp-Add-display-pipeline-components.patch"
Content-Disposition: attachment;
 filename*0="0001-arm64-dts-imx8mp-Add-display-pipeline-components.patch"
Content-Transfer-Encoding: base64

RnJvbSBmN2U4NWVmMTRjNTJlODRlNDk1YWI4NWZkMDcyNjNlNWI5MDliZjdmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KRGF0
ZTogU3VuLCAyNyBGZWIgMjAyMiAwMjoyMDowNSArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIGFy
bTY0OiBkdHM6IGlteDhtcDogQWRkIGRpc3BsYXkgcGlwZWxpbmUgY29tcG9uZW50cwpNSU1F
LVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgK
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKQWRkIERTSU0sIERTSU0gUEhZLCBM
Q0RJRjEgYW5kIG1lZGlhbWl4IGJsa19jdGwgbm9kZXMgZm9yIGlNWDhNUC4KVGhlIGJsa19j
dGwgaXMgcmVxdWlyZWQgdG8gZW5hYmxlIExDRElGIGNsb2NrIGFuZCBEU0lNIGNsb2NrLCBh
bmQKaGFuZGxlIERTSU0gcmVzZXRzLgoKVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nClNpZ25l
ZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgpDYzogQWJlbCBWZXNhIDxh
YmVsLnZlc2FAbnhwLmNvbT4KQ2M6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5j
b20+CkNjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+CkNjOiBHdWlkbyBH
w7xudGhlciA8YWd4QHNpZ3hjcHUub3JnPgpDYzogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVu
Z3V0cm9uaXguZGU+CkNjOiBOWFAgTGludXggVGVhbSA8bGludXgtaW14QG54cC5jb20+CkNj
OiBSb2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPgpDYzogU2hhd24gR3VvIDxzaGF3
bmd1b0BrZXJuZWwub3JnPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtcC5kdHNpIHwgMTQ0ICsrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMzkgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAuZHRzaSBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvZnJlZXNjYWxlL2lteDhtcC5kdHNpCmluZGV4IGJiOTE2YTA5NDhhOGYuLmFlZjM5
ZDYyYjQ3ZDcgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtcC5kdHNpCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC5k
dHNpCkBAIC01MzMsNiArNTMzLDcgQEAgcGdjIHsKIAkJCQkJcGdjX21pcGlfcGh5MTogcG93
ZXItZG9tYWluQDAgewogCQkJCQkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwwPjsKIAkJCQkJ
CXJlZyA9IDxJTVg4TVBfUE9XRVJfRE9NQUlOX01JUElfUEhZMT47CisJCQkJCQlwb3dlci1k
b21haW5zID0gPCZwZ2NfbWVkaWFtaXg+OwogCQkJCQl9OwogCiAJCQkJCXBnY19wY2llX3Bo
eTogcG93ZXItZG9tYWluQDEgewpAQCAtNTg3LDYgKzU4OCw3IEBAIHBnY19tZWRpYW1peDog
cG93ZXItZG9tYWluQDEwIHsKIAkJCQkJcGdjX21pcGlfcGh5MjogcG93ZXItZG9tYWluQDE2
IHsKIAkJCQkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8MD47CiAJCQkJCQlyZWcgPSA8SU1Y
OE1QX1BPV0VSX0RPTUFJTl9NSVBJX1BIWTI+OworCQkJCQkJcG93ZXItZG9tYWlucyA9IDwm
cGdjX21lZGlhbWl4PjsKIAkJCQkJfTsKIAogCQkJCQlwZ2NfaHNpb21peDogcG93ZXItZG9t
YWluc0AxNyB7CkBAIC0xMDgyLDcgKzEwODQsNyBAQCBhaXBzNDogYnVzQDMyYzAwMDAwIHsK
IAogCQkJbWVkaWFfYmxrX2N0cmw6IGJsay1jdHJsQDMyZWMwMDAwIHsKIAkJCQljb21wYXRp
YmxlID0gImZzbCxpbXg4bXAtbWVkaWEtYmxrLWN0cmwiLAotCQkJCQkgICAgICJzeXNjb24i
OworCQkJCQkgICAgICJzaW1wbGUtYnVzIiwgInN5c2NvbiI7CiAJCQkJcmVnID0gPDB4MzJl
YzAwMDAgMHgxMDAwMD47CiAJCQkJcG93ZXItZG9tYWlucyA9IDwmcGdjX21lZGlhbWl4PiwK
IAkJCQkJCTwmcGdjX21pcGlfcGh5MT4sCkBAIC0xMTIwLDE0ICsxMTIyLDE0NiBAQCBtZWRp
YV9ibGtfY3RybDogYmxrLWN0cmxAMzJlYzAwMDAgewogCQkJCQkgPCZjbGsgSU1YOE1QX0NM
S19NRURJQV9NSVBJX1BIWTFfUkVGX1JPT1Q+OwogCQkJCWNsb2NrLW5hbWVzID0gImFwYiIs
ICJheGkiLCAiY2FtMSIsICJjYW0yIiwKIAkJCQkJICAgICAgImRpc3AxIiwgImRpc3AyIiwg
ImlzcCIsICJwaHkiOworCQkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIElNWDhNUF9DTEtf
TUVESUFfRElTUDFfUElYPiwKKwkJCQkJCSAgPCZjbGsgSU1YOE1QX0NMS19NRURJQV9ESVNQ
Ml9QSVg+LAorCQkJCQkJICA8JmNsayBJTVg4TVBfVklERU9fUExMMV9PVVQ+OworCQkJCWFz
c2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsayBJTVg4TVBfVklERU9fUExMMV9PVVQ+LAor
CQkJCQkJCSA8JmNsayBJTVg4TVBfVklERU9fUExMMV9PVVQ+OworCQkJCWFzc2lnbmVkLWNs
b2NrLXJhdGVzID0gPDA+LCA8MD4sIDw1OTQwMDAwMDA+OworCisJCQkJI3Bvd2VyLWRvbWFp
bi1jZWxscyA9IDwxPjsKIAotCQkJCWFzc2lnbmVkLWNsb2NrcyA9IDwmY2xrIElNWDhNUF9D
TEtfTUVESUFfQVhJPiwKKwkJCQlsdmRzX2xkYjogbHZkcy1sZGIgeworCQkJCQkjYWRkcmVz
cy1jZWxscyA9IDwwPjsKKwkJCQkJI3NpemUtY2VsbHMgPSA8MD47CisJCQkJCWNvbXBhdGli
bGUgPSAiZnNsLGlteDhtcC1sZGIiOworCQkJCQljbG9ja3MgPSA8JmNsayBJTVg4TVBfQ0xL
X01FRElBX0xEQj47CisJCQkJCWNsb2NrLW5hbWVzID0gImxkYiI7CisJCQkJCWFzc2lnbmVk
LWNsb2NrcyA9IDwmY2xrIElNWDhNUF9DTEtfTUVESUFfTERCPjsKKwkJCQkJYXNzaWduZWQt
Y2xvY2stcGFyZW50cyA9IDwmY2xrIElNWDhNUF9WSURFT19QTEwxX09VVD47CisKKwkJCQkJ
cG9ydHMgeworCQkJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CisJCQkJCQkjc2l6ZS1jZWxs
cyA9IDwwPjsKKwkJCQkJCXBvcnRAMCB7CisJCQkJCQkJcmVnID0gPDA+OworCisJCQkJCQkJ
bGRiX2Zyb21fbGNkaWYyOiBlbmRwb2ludCB7CisJCQkJCQkJCXJlbW90ZS1lbmRwb2ludCA9
IDwmbGNkaWYyX3RvX2xkYj47CisJCQkJCQkJfTsKKwkJCQkJCX07CisKKwkJCQkJCS8qIExW
RFMgc2luZ2xlLWxpbmsgb3IgZHVhbC1saW5rICovCisJCQkJCQlwb3J0QDEgeworCQkJCQkJ
CXJlZyA9IDwxPjsKKworCQkJCQkJCWxkYl9sdmRzX2NoMDogZW5kcG9pbnQgeworCQkJCQkJ
CX07CisJCQkJCQl9OworCisJCQkJCQlwb3J0QDIgeworCQkJCQkJCXJlZyA9IDwyPjsKKwor
CQkJCQkJCWxkYl9sdmRzX2NoMTogZW5kcG9pbnQgeworCQkJCQkJCX07CisJCQkJCQl9Owor
CQkJCQl9OworCQkJCX07CisJCQl9OworCisJCQltaXBpX2RzaTogbWlwaV9kc2lAMzJlNjAw
MDAgeworCQkJCSNhZGRyZXNzLWNlbGxzID0gPDA+OworCQkJCSNzaXplLWNlbGxzID0gPDA+
OworCQkJCWNvbXBhdGlibGUgPSAiZnNsLGlteDhtcC1taXBpLWRzaW0iOworCQkJCXJlZyA9
IDwweDMyZTYwMDAwIDB4NDAwPjsKKwkJCQljbG9ja3MgPSA8JmNsayBJTVg4TVBfQ0xLX01F
RElBX0FQQj4sCisJCQkJCSA8JmNsayBJTVg4TVBfQ0xLX01FRElBX01JUElfUEhZMV9SRUY+
OworCQkJCWNsb2NrLW5hbWVzID0gImJ1c19jbGsiLCAic2Nsa19taXBpIjsKKwkJCQlhc3Np
Z25lZC1jbG9ja3MgPSA8JmNsayBJTVg4TVBfQ0xLX01FRElBX0FQQj4sCisJCQkJCQkgIDwm
Y2xrIElNWDhNUF9DTEtfTUVESUFfTUlQSV9QSFkxX1JFRj47CisJCQkJYXNzaWduZWQtY2xv
Y2stcGFyZW50cyA9IDwmY2xrIElNWDhNUF9TWVNfUExMMV8yNjZNPiwKKwkJCQkJCQkgPCZj
bGsgSU1YOE1QX0NMS18yNE0+OworCQkJCWFzc2lnbmVkLWNsb2NrLXJhdGVzID0gPDI2NjAw
MDAwMD4sIDwyNDAwMDAwMD47CisJCQkJc2Ftc3VuZyxwbGwtY2xvY2stZnJlcXVlbmN5ID0g
PDI0MDAwMDAwPjsKKwkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMTggSVJRX1RZUEVfTEVW
RUxfSElHSD47CisJCQkJcG93ZXItZG9tYWlucyA9IDwmbWVkaWFfYmxrX2N0cmwgSU1YOE1Q
X01FRElBQkxLX1BEX01JUElfRFNJXzE+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJ
CQkJcG9ydHMgeworCQkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKKwkJCQkJI3NpemUtY2Vs
bHMgPSA8MD47CisJCQkJCXBvcnRAMCB7CisJCQkJCQlyZWcgPSA8MD47CisKKwkJCQkJCWRz
aW1fZnJvbV9sY2RpZjE6IGVuZHBvaW50IHsKKwkJCQkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8
JmxjZGlmMV90b19kc2ltPjsKKwkJCQkJCX07CisJCQkJCX07CisJCQkJfTsKKwkJCX07CisK
KwkJCWxjZGlmMTogZGlzcGxheS1jb250cm9sbGVyQDMyZTgwMDAwIHsKKwkJCQkjYWRkcmVz
cy1jZWxscyA9IDwwPjsKKwkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQljb21wYXRpYmxl
ID0gImZzbCxpbXg4bXAtbGNkaWYiOworCQkJCXJlZyA9IDwweDMyZTgwMDAwIDB4MTAwMDA+
OworCQkJCWNsb2NrcyA9IDwmY2xrIElNWDhNUF9DTEtfTUVESUFfRElTUDFfUElYX1JPT1Q+
LAorCQkJCQkgPCZjbGsgSU1YOE1QX0NMS19NRURJQV9BWElfUk9PVD4sCisJCQkJCSA8JmNs
ayBJTVg4TVBfQ0xLX01FRElBX0FQQl9ST09UPjsKKwkJCQljbG9jay1uYW1lcyA9ICJwaXgi
LCAiZGlzcF9heGkiLCAiYXhpIjsKKwkJCQlhc3NpZ25lZC1jbG9ja3MgPSA8JmNsayBJTVg4
TVBfQ0xLX01FRElBX0RJU1AxX1BJWF9ST09UPiwKKwkJCQkJCSAgPCZjbGsgSU1YOE1QX0NM
S19NRURJQV9BWEk+LAogCQkJCQkJICA8JmNsayBJTVg4TVBfQ0xLX01FRElBX0FQQj47Ci0J
CQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY2xrIElNWDhNUF9TWVNfUExMMl8xMDAw
TT4sCisJCQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmY2xrIElNWDhNUF9DTEtfTUVE
SUFfRElTUDFfUElYPiwKKwkJCQkJCQkgPCZjbGsgSU1YOE1QX1NZU19QTEwyXzEwMDBNPiwK
IAkJCQkJCQkgPCZjbGsgSU1YOE1QX1NZU19QTEwxXzgwME0+OwotCQkJCWFzc2lnbmVkLWNs
b2NrLXJhdGVzID0gPDUwMDAwMDAwMD4sIDwyMDAwMDAwMDA+OworCQkJCWFzc2lnbmVkLWNs
b2NrLXJhdGVzID0gPDU5NDAwMDAwMD4sIDw1MDAwMDAwMDA+LCA8MjAwMDAwMDAwPjsKKwkJ
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKKwkJCQlw
b3dlci1kb21haW5zID0gPCZtZWRpYV9ibGtfY3RybCBJTVg4TVBfTUVESUFCTEtfUERfTENE
SUZfMT47CisJCQkJc3RhdHVzID0gImRpc2FibGVkIjsKKwkJCQlwb3J0cyB7CisJCQkJCSNh
ZGRyZXNzLWNlbGxzID0gPDE+OworCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKKwkJCQkJcG9y
dEAwIHsKKwkJCQkJCXJlZyA9IDwwPjsKIAotCQkJCSNwb3dlci1kb21haW4tY2VsbHMgPSA8
MT47CisJCQkJCQlsY2RpZjFfdG9fZHNpbTogZW5kcG9pbnQgeworCQkJCQkJCXJlbW90ZS1l
bmRwb2ludCA9IDwmZHNpbV9mcm9tX2xjZGlmMT47CisJCQkJCQl9OworCQkJCQl9OworCQkJ
CX07CisJCQl9OworCisJCQlsY2RpZjI6IGRpc3BsYXktY29udHJvbGxlckAzMmU5MDAwMCB7
CisJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MD47CisJCQkJI3NpemUtY2VsbHMgPSA8MD47CisJ
CQkJY29tcGF0aWJsZSA9ICJmc2wsaW14OG1wLWxjZGlmIjsKKwkJCQlyZWcgPSA8MHgzMmU5
MDAwMCAweDEwMDAwPjsKKwkJCQljbG9ja3MgPSA8JmNsayBJTVg4TVBfQ0xLX01FRElBX0RJ
U1AyX1BJWF9ST09UPiwKKwkJCQkJIDwmY2xrIElNWDhNUF9DTEtfTUVESUFfQVhJX1JPT1Q+
LAorCQkJCQkgPCZjbGsgSU1YOE1QX0NMS19NRURJQV9BUEJfUk9PVD47CisJCQkJY2xvY2st
bmFtZXMgPSAicGl4IiwgImRpc3BfYXhpIiwgImF4aSI7CisJCQkJYXNzaWduZWQtY2xvY2tz
ID0gPCZjbGsgSU1YOE1QX0NMS19NRURJQV9ESVNQMl9QSVhfUk9PVD4sCisJCQkJCQkgIDwm
Y2xrIElNWDhNUF9DTEtfTUVESUFfQVhJPiwKKwkJCQkJCSAgPCZjbGsgSU1YOE1QX0NMS19N
RURJQV9BUEI+OworCQkJCWFzc2lnbmVkLWNsb2NrLXBhcmVudHMgPSA8JmNsayBJTVg4TVBf
Q0xLX01FRElBX0RJU1AyX1BJWD4sCisJCQkJCQkJIDwmY2xrIElNWDhNUF9TWVNfUExMMl8x
MDAwTT4sCisJCQkJCQkJIDwmY2xrIElNWDhNUF9TWVNfUExMMV84MDBNPjsKKwkJCQlhc3Np
Z25lZC1jbG9jay1yYXRlcyA9IDw1OTQwMDAwMDA+LCA8NTAwMDAwMDAwPiwgPDIwMDAwMDAw
MD47CisJCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDYgSVJRX1RZUEVfTEVWRUxfSElHSD47
CisJCQkJcG93ZXItZG9tYWlucyA9IDwmbWVkaWFfYmxrX2N0cmwgSU1YOE1QX01FRElBQkxL
X1BEX0xDRElGXzI+OworCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7CisKKwkJCQlwb3J0cyB7
CisJCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OworCQkJCQkjc2l6ZS1jZWxscyA9IDwwPjsK
KwkJCQkJcG9ydEAwIHsKKwkJCQkJCXJlZyA9IDwwPjsKKworCQkJCQkJbGNkaWYyX3RvX2xk
YjogZW5kcG9pbnQgeworCQkJCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbGRiX2Zyb21fbGNk
aWYyPjsKKwkJCQkJCX07CisJCQkJCX07CisJCQkJfTsKIAkJCX07CiAKIAkJCXBjaWVfcGh5
OiBwY2llLXBoeUAzMmYwMDAwMCB7Ci0tIAoyLjM5LjAKCg==

--------------g08fYK75NVO0I8Y99d04itGS--
