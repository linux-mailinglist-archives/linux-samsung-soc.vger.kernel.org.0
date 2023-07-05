Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D33C748680
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Jul 2023 16:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbjGEOiT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 5 Jul 2023 10:38:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232214AbjGEOiR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 10:38:17 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F1EBC;
        Wed,  5 Jul 2023 07:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1688567888;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SbGsdRos9lr6JUVyzk1s1zgD1oAk2OBQlPBSuytJBro=;
        b=KTRK5PGW78Z/Tb/e8WZwyhzwo6R3Q/x6jDcjL0urvHIXutudKjCow8njoz3M49cZsvtCxr
        /qIkZwj+RKeUvPF8QMzbQZbor9bZsB9v7XZjaEz+m8FlQLYyDDmb71Mo6rsyVhcSxxBFHS
        hY3ZBl6jTUBFkBjvNdGdaOcWznHXHcw=
Message-ID: <8e81dd5d9f62139e740ea123aa2087cb1bbcb04b.camel@crapouillou.net>
Subject: Re: [PATCH 2/3] drm/panel: ld9040: Register a backlight device
From:   Paul Cercueil <paul@crapouillou.net>
To:     neil.armstrong@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Date:   Wed, 05 Jul 2023 16:38:05 +0200
In-Reply-To: <194ac047-b20e-04c1-1d96-67cc483bb4a1@linaro.org>
References: <20230703214715.623447-1-paul@crapouillou.net>
         <20230703214715.623447-3-paul@crapouillou.net>
         <194ac047-b20e-04c1-1d96-67cc483bb4a1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

SGkgTmVpbCwKCkxlIG1lcmNyZWRpIDA1IGp1aWxsZXQgMjAyMyDDoCAxNTo1NyArMDIwMCwgTmVp
bCBBcm1zdHJvbmcgYSDDqWNyaXTCoDoKPiBPbiAwMy8wNy8yMDIzIDIzOjQ3LCBQYXVsIENlcmN1
ZWlsIHdyb3RlOgo+ID4gUmVnaXN0ZXIgYSBiYWNrbGlnaHQgZGV2aWNlIHRvIGJlIGFibGUgdG8g
c3dpdGNoIGJldHdlZW4gYWxsIHRoZQo+ID4gZ2FtbWEKPiA+IGxldmVscy4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gPiAtLS0K
PiA+IMKgIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLWxkOTA0MC5jIHwgNDAK
PiA+ICsrKysrKysrKysrKysrKysrKysrCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgNDAgaW5zZXJ0
aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXNhbXN1bmctbGQ5MDQwLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1
bmctbGQ5MDQwLmMKPiA+IGluZGV4IDdmZDk0NDRiNDJjNS4uYjRmODdkNjI0NGNiIDEwMDY0NAo+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctbGQ5MDQwLmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zYW1zdW5nLWxkOTA0MC5jCj4gPiBA
QCAtOCw2ICs4LDcgQEAKPiA+IMKgwqAgKiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcu
Y29tPgo+ID4gwqAgKi8KPiA+IMKgIAo+ID4gKyNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4K
PiA+IMKgICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ID4gwqAgI2luY2x1ZGUgPGxpbnV4L2dw
aW8vY29uc3VtZXIuaD4KPiA+IMKgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+IEBAIC0z
MTEsOCArMzEyLDQwIEBAIHN0YXRpYyBpbnQgbGQ5MDQwX3BhcnNlX2R0KHN0cnVjdCBsZDkwNDAg
KmN0eCkKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiA+IMKgIH0KPiA+IMKgIAo+ID4g
K3N0YXRpYyBpbnQgbGQ5MDQwX2JsX3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdodF9kZXZp
Y2UgKmRldikKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgbGQ5MDQwICpjdHggPSBk
ZXZfZ2V0X2RydmRhdGEoJmRldi0+ZGV2KTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGN0eC0+
YnJpZ2h0bmVzcyA9IGRldi0+cHJvcHMuYnJpZ2h0bmVzczsKPiA+ICvCoMKgwqDCoMKgwqDCoGxk
OTA0MF9icmlnaHRuZXNzX3NldChjdHgpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgbGQ5MDQwX2JsX2dldF9pbnRlbnNpdHko
c3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmRldikKPiA+ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBp
ZiAoZGV2LT5wcm9wcy5mYl9ibGFuayA9PSBGQl9CTEFOS19VTkJMQU5LICYmCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRldi0+cHJvcHMucG93ZXIg
PT0gRkJfQkxBTktfVU5CTEFOSykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBy
ZXR1cm4gZGV2LT5wcm9wcy5icmlnaHRuZXNzOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7Cj4gPiArfQo+IAo+IFlvdSBjYW4gdG90YWxseSBkcm9wIHRoZSBfZ2V0X2JyaWdodG5l
c3MuCgpUaGUgY3VycmVudCBiZWhhdmlvdXIgaXMgdG8gcmV0dXJuIDAgd2hlbiB0aGUgZnJhbWVi
dWZmZXIgaXMgYmxhbmtlZC4gQQpmZXcgZHJpdmVycyBkbyB0aGF0IHNvIEkgdGhvdWdodCBpdCB3
YXMgdGhlIG5vcm07IGFuZCB0aGUgYmFja2xpZ2h0CmNvcmUgZG9lc24ndCBkbyB0aGF0IGJ5IGRl
ZmF1bHQgKGFuZCBqdXN0IHVzZXMgZGV2LT5wcm9wcy5icmlnaHRuZXNzKS4KCkl0IGlzIG5vdCBj
bGVhciB0byBtZSBpZiB0aGF0J3MgdGhlIHByZWZlcnJlZCBiZWhhdmlvdXIuIFRoZQoiYmFja2xp
Z2h0X2dldF9icmlnaHRuZXNzIiBmdW5jdGlvbiBpbiBiYWNrbGlnaHQuaCBzZWVtcyB0byBzdWdn
ZXN0CnRoYXQgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIGlzIGNvcnJlY3QsIHVubGVzcyBpdCBpcyBu
b3Qgc3VwcG9zZWQgdG8gYmUKdXNlZCBpbiB0aGUgYmFja2xpZ2h0X29wcy5nZXRfYnJpZ2h0bmVz
cygpIGNhbGxiYWNrLiBUaGVuIGluIHRoYXQgY2FzZQpzb21lIG90aGVyIGRyaXZlcnMgZ2V0IGl0
IHdyb25nIHRvby4KCkNoZWVycywKLVBhdWwKCj4gTmVpbAo+IAo+ID4gKwo+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3QgYmFja2xpZ2h0X29wcyBsZDkwNDBfYmxfb3BzID0gewo+ID4gK8KgwqDCoMKg
wqDCoMKgLmdldF9icmlnaHRuZXNzID0gbGQ5MDQwX2JsX2dldF9pbnRlbnNpdHksCj4gPiArwqDC
oMKgwqDCoMKgwqAudXBkYXRlX3N0YXR1c8KgID0gbGQ5MDQwX2JsX3VwZGF0ZV9zdGF0dXMsCj4g
PiArfTsKPiA+ICsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGJhY2tsaWdodF9wcm9wZXJ0aWVz
IGxkOTA0MF9ibF9wcm9wcyA9IHsKPiA+ICvCoMKgwqDCoMKgwqDCoC50eXBlID0gQkFDS0xJR0hU
X1JBVywKPiA+ICvCoMKgwqDCoMKgwqDCoC5zY2FsZSA9IEJBQ0tMSUdIVF9TQ0FMRV9OT05fTElO
RUFSLAo+ID4gK8KgwqDCoMKgwqDCoMKgLm1heF9icmlnaHRuZXNzID0gQVJSQVlfU0laRShsZDkw
NDBfZ2FtbWFzKSAtIDEsCj4gPiArwqDCoMKgwqDCoMKgwqAuYnJpZ2h0bmVzcyA9IEFSUkFZX1NJ
WkUobGQ5MDQwX2dhbW1hcykgLSAxLAo+ID4gK307Cj4gPiArCj4gPiDCoCBzdGF0aWMgaW50IGxk
OTA0MF9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQo+ID4gwqAgewo+ID4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJsZGV2Owo+ID4gwqDCoMKgwqDCoMKgwqDC
oHN0cnVjdCBkZXZpY2UgKmRldiA9ICZzcGktPmRldjsKPiA+IMKgwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgbGQ5MDQwICpjdHg7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiA+IEBAIC0zNTQs
NiArMzg3LDEzIEBAIHN0YXRpYyBpbnQgbGQ5MDQwX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlCj4g
PiAqc3BpKQo+ID4gwqDCoMKgwqDCoMKgwqDCoGRybV9wYW5lbF9pbml0KCZjdHgtPnBhbmVsLCBk
ZXYsICZsZDkwNDBfZHJtX2Z1bmNzLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgRFJNX01PREVfQ09OTkVDVE9SX0RQSSk7Cj4gPiDCoCAKPiA+ICsKPiA+
ICvCoMKgwqDCoMKgwqDCoGJsZGV2ID0gZGV2bV9iYWNrbGlnaHRfZGV2aWNlX3JlZ2lzdGVyKGRl
diwgZGV2X25hbWUoZGV2KSwKPiA+IGRldiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY3R4LCAmbGQ5MDQwX2JsX29wcywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgJmxkOTA0MF9ibF9wcm9wcyk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNf
RVJSKGJsZGV2KSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gUFRS
X0VSUihibGRldik7Cj4gPiArCj4gPiDCoMKgwqDCoMKgwqDCoMKgZHJtX3BhbmVsX2FkZCgmY3R4
LT5wYW5lbCk7Cj4gPiDCoCAKPiA+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gMDsKPiAKCg==

