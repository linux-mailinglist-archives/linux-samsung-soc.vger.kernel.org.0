Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D706C447EEE
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Nov 2021 12:32:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237827AbhKHLfa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 8 Nov 2021 06:35:30 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:42176 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239265AbhKHLf1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 06:35:27 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id A1B621FD6E;
        Mon,  8 Nov 2021 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636371160; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EwkDiCE7DB4EbNs+X7Cd3CC6FOJohQ/+bNMydyjxi9I=;
        b=mICdz9/wogYcMlsAzY03J55yRdTiz76IBGAHOO4YkNZAgmngfbJK6dGeXeV2ElIh2XWnAq
        cTw0Aqch3ZcWQBlRPQl82OjDmGFZTWyLXgr16N2oZcC8fZfJHG4PpJXFvW+w6tm+7bhATh
        znlEqbhZalB9DYUgxD7zl1u+mHuP5CI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636371160;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EwkDiCE7DB4EbNs+X7Cd3CC6FOJohQ/+bNMydyjxi9I=;
        b=ftaD+clFHlmzE49X4L0ABG8HIVKE2Wpd+M6av6eoeihvDhxe+5yqVYWMKLB7dVY4R1ke1W
        a+mae/pwzuKHkvDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 535D513B4A;
        Mon,  8 Nov 2021 11:32:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OtolE9gKiWFBRAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 11:32:40 +0000
Message-ID: <cd51b87a-5a07-fbf8-0e8e-d30f8a592d98@suse.de>
Date:   Mon, 8 Nov 2021 12:32:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/3] drm/xen: Implement mmap as GEM object function
Content-Language: en-US
To:     Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "airlied@linux.ie" <airlied@linux.ie>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "inki.dae@samsung.com" <inki.dae@samsung.com>,
        "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>,
        "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
        "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
        "krzysztof.kozlowski@canonical.com" 
        <krzysztof.kozlowski@canonical.com>
Cc:     "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-3-tzimmermann@suse.de>
 <e727222a-3611-f1c0-a176-2214eb9553be@epam.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e727222a-3611-f1c0-a176-2214eb9553be@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0AOeEutgkiNVV1IRkB2IcmOG"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0AOeEutgkiNVV1IRkB2IcmOG
Content-Type: multipart/mixed; boundary="------------pNvdFciOihALwXILgN9Us0jY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "airlied@linux.ie" <airlied@linux.ie>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "inki.dae@samsung.com" <inki.dae@samsung.com>,
 "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <cd51b87a-5a07-fbf8-0e8e-d30f8a592d98@suse.de>
Subject: Re: [PATCH 2/3] drm/xen: Implement mmap as GEM object function
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-3-tzimmermann@suse.de>
 <e727222a-3611-f1c0-a176-2214eb9553be@epam.com>
In-Reply-To: <e727222a-3611-f1c0-a176-2214eb9553be@epam.com>

--------------pNvdFciOihALwXILgN9Us0jY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMTE6NDYgc2NocmllYiBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbzoNCj4gSGksIFRob21hcyENCj4gDQo+IE9uIDA4LjExLjIxIDEyOjI4LCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4+IE1vdmluZyB0aGUgZHJpdmVyLXNwZWNpZmljIG1tYXAg
Y29kZSBpbnRvIGEgR0VNIG9iamVjdCBmdW5jdGlvbiBhbGxvd3MNCj4+IGZvciB1c2luZyBE
Uk0gaGVscGVycyBmb3IgdmFyaW91cyBtbWFwIGNhbGxiYWNrcy4NCj4+DQo+PiBUaGUgcmVz
cGVjdGl2ZSB4ZW4gZnVuY3Rpb25zIGFyZSBiZWluZyByZW1vdmVkLiBUaGUgZmlsZV9vcGVy
YXRpb25zDQo+PiBzdHJ1Y3R1cmUgZm9wcyBpcyBub3cgYmVpbmcgY3JlYXRlZCBieSB0aGUg
aGVscGVyIG1hY3JvDQo+PiBERUZJTkVfRFJNX0dFTV9GT1BTKCkuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFJl
dmlld2VkLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+DQoNClRoYXQgd2FzIHF1aWNrISBUaGFua3MgYSBsb3QuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4+IC0tLQ0KPj4gICAgZHJpdmVycy9ncHUvZHJtL3hl
bi94ZW5fZHJtX2Zyb250LmMgICAgIHwgIDE2ICstLS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2Ry
bS94ZW4veGVuX2RybV9mcm9udF9nZW0uYyB8IDEwOCArKysrKysrKystLS0tLS0tLS0tLS0t
LS0NCj4+ICAgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uaCB8ICAg
NyAtLQ0KPj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA4NyBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250LmMgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYw0KPj4g
aW5kZXggOWYxNGQ5OWM3NjNjLi40MzQwNjRjODIwZTggMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnQuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMNCj4+IEBAIC00NjksMTkgKzQ2OSw3IEBAIHN0YXRp
YyB2b2lkIHhlbl9kcm1fZHJ2X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+
ICAgIAlrZnJlZShkcm1faW5mbyk7DQo+PiAgICB9DQo+PiAgICANCj4+IC1zdGF0aWMgY29u
c3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyB4ZW5fZHJtX2Rldl9mb3BzID0gew0KPj4gLQku
b3duZXIgICAgICAgICAgPSBUSElTX01PRFVMRSwNCj4+IC0JLm9wZW4gICAgICAgICAgID0g
ZHJtX29wZW4sDQo+PiAtCS5yZWxlYXNlICAgICAgICA9IGRybV9yZWxlYXNlLA0KPj4gLQku
dW5sb2NrZWRfaW9jdGwgPSBkcm1faW9jdGwsDQo+PiAtI2lmZGVmIENPTkZJR19DT01QQVQN
Cj4+IC0JLmNvbXBhdF9pb2N0bCAgID0gZHJtX2NvbXBhdF9pb2N0bCwNCj4+IC0jZW5kaWYN
Cj4+IC0JLnBvbGwgICAgICAgICAgID0gZHJtX3BvbGwsDQo+PiAtCS5yZWFkICAgICAgICAg
ICA9IGRybV9yZWFkLA0KPj4gLQkubGxzZWVrICAgICAgICAgPSBub19sbHNlZWssDQo+PiAt
CS5tbWFwICAgICAgICAgICA9IHhlbl9kcm1fZnJvbnRfZ2VtX21tYXAsDQo+PiAtfTsNCj4+
ICtERUZJTkVfRFJNX0dFTV9GT1BTKHhlbl9kcm1fZGV2X2ZvcHMpOw0KPj4gICAgDQo+PiAg
ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgeGVuX2RybV9kcml2ZXIgPSB7DQo+
PiAgICAJLmRyaXZlcl9mZWF0dXJlcyAgICAgICAgICAgPSBEUklWRVJfR0VNIHwgRFJJVkVS
X01PREVTRVQgfCBEUklWRVJfQVRPTUlDLA0KPj4gQEAgLTQ4OSw3ICs0NzcsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgeGVuX2RybV9kcml2ZXIgPSB7DQo+PiAgICAJ
LnByaW1lX2hhbmRsZV90b19mZCAgICAgICAgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19m
ZCwNCj4+ICAgIAkucHJpbWVfZmRfdG9faGFuZGxlICAgICAgICA9IGRybV9nZW1fcHJpbWVf
ZmRfdG9faGFuZGxlLA0KPj4gICAgCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0geGVu
X2RybV9mcm9udF9nZW1faW1wb3J0X3NnX3RhYmxlLA0KPj4gLQkuZ2VtX3ByaW1lX21tYXAg
ICAgICAgICAgICA9IHhlbl9kcm1fZnJvbnRfZ2VtX3ByaW1lX21tYXAsDQo+PiArCS5nZW1f
cHJpbWVfbW1hcCAgICAgICAgICAgID0gZHJtX2dlbV9wcmltZV9tbWFwLA0KPj4gICAgCS5k
dW1iX2NyZWF0ZSAgICAgICAgICAgICAgID0geGVuX2RybV9kcnZfZHVtYl9jcmVhdGUsDQo+
PiAgICAJLmZvcHMgICAgICAgICAgICAgICAgICAgICAgPSAmeGVuX2RybV9kZXZfZm9wcywN
Cj4+ICAgIAkubmFtZSAgICAgICAgICAgICAgICAgICAgICA9ICJ4ZW5kcm0tZHUiLA0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYyBi
L2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYw0KPj4gaW5kZXggYjI5
M2M2NzIzMGVmLi5kZDM1OGJhMmJmOGUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZW4veGVuX2RybV9mcm9udF9nZW0uYw0KPj4gQEAgLTU3LDYgKzU3LDQ3IEBAIHN0YXRpYyB2
b2lkIGdlbV9mcmVlX3BhZ2VzX2FycmF5KHN0cnVjdCB4ZW5fZ2VtX29iamVjdCAqeGVuX29i
aikNCj4+ICAgIAl4ZW5fb2JqLT5wYWdlcyA9IE5VTEw7DQo+PiAgICB9DQo+PiAgICANCj4+
ICtzdGF0aWMgaW50IHhlbl9kcm1fZnJvbnRfZ2VtX29iamVjdF9tbWFwKHN0cnVjdCBkcm1f
Z2VtX29iamVjdCAqZ2VtX29iaiwNCj4+ICsJCQkJCSBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSkNCj4+ICt7DQo+PiArCXN0cnVjdCB4ZW5fZ2VtX29iamVjdCAqeGVuX29iaiA9IHRv
X3hlbl9nZW1fb2JqKGdlbV9vYmopOw0KPj4gKwlpbnQgcmV0Ow0KPj4gKw0KPj4gKwl2bWEt
PnZtX29wcyA9IGdlbV9vYmotPmZ1bmNzLT52bV9vcHM7DQo+PiArDQo+PiArCS8qDQo+PiAr
CSAqIENsZWFyIHRoZSBWTV9QRk5NQVAgZmxhZyB0aGF0IHdhcyBzZXQgYnkgZHJtX2dlbV9t
bWFwKCksIGFuZCBzZXQgdGhlDQo+PiArCSAqIHZtX3Bnb2ZmICh1c2VkIGFzIGEgZmFrZSBi
dWZmZXIgb2Zmc2V0IGJ5IERSTSkgdG8gMCBhcyB3ZSB3YW50IHRvIG1hcA0KPj4gKwkgKiB0
aGUgd2hvbGUgYnVmZmVyLg0KPj4gKwkgKi8NCj4+ICsJdm1hLT52bV9mbGFncyAmPSB+Vk1f
UEZOTUFQOw0KPj4gKwl2bWEtPnZtX2ZsYWdzIHw9IFZNX01JWEVETUFQOw0KPj4gKwl2bWEt
PnZtX3Bnb2ZmID0gMDsNCj4+ICsNCj4+ICsJLyoNCj4+ICsJICogQWNjb3JkaW5nIHRvIFhl
biBvbiBBUk0gQUJJICh4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCk6DQo+PiArCSAq
IGFsbCBtZW1vcnkgd2hpY2ggaXMgc2hhcmVkIHdpdGggb3RoZXIgZW50aXRpZXMgaW4gdGhl
IHN5c3RlbQ0KPj4gKwkgKiAoaW5jbHVkaW5nIHRoZSBoeXBlcnZpc29yIGFuZCBvdGhlciBn
dWVzdHMpIG11c3QgcmVzaWRlIGluIG1lbW9yeQ0KPj4gKwkgKiB3aGljaCBpcyBtYXBwZWQg
YXMgTm9ybWFsIElubmVyIFdyaXRlLUJhY2sgT3V0ZXIgV3JpdGUtQmFjaw0KPj4gKwkgKiBJ
bm5lci1TaGFyZWFibGUuDQo+PiArCSAqLw0KPj4gKwl2bWEtPnZtX3BhZ2VfcHJvdCA9IHZt
X2dldF9wYWdlX3Byb3Qodm1hLT52bV9mbGFncyk7DQo+PiArDQo+PiArCS8qDQo+PiArCSAq
IHZtX29wZXJhdGlvbnNfc3RydWN0LmZhdWx0IGhhbmRsZXIgd2lsbCBiZSBjYWxsZWQgaWYg
Q1BVIGFjY2Vzcw0KPj4gKwkgKiB0byBWTSBpcyBoZXJlLiBGb3IgR1BVcyB0aGlzIGlzbid0
IHRoZSBjYXNlLCBiZWNhdXNlIENQVSAgZG9lc24ndA0KPj4gKwkgKiB0b3VjaCB0aGUgbWVt
b3J5LiBJbnNlcnQgcGFnZXMgbm93LCBzbyBib3RoIENQVSBhbmQgR1BVIGFyZSBoYXBweS4N
Cj4+ICsJICoNCj4+ICsJICogRklYTUU6IGFzIHdlIGluc2VydCBhbGwgdGhlIHBhZ2VzIG5v
dyB0aGVuIG5vIC5mYXVsdCBoYW5kbGVyIG11c3QNCj4+ICsJICogYmUgY2FsbGVkLCBzbyBk
b24ndCBwcm92aWRlIG9uZQ0KPj4gKwkgKi8NCj4+ICsJcmV0ID0gdm1fbWFwX3BhZ2VzKHZt
YSwgeGVuX29iai0+cGFnZXMsIHhlbl9vYmotPm51bV9wYWdlcyk7DQo+PiArCWlmIChyZXQg
PCAwKQ0KPj4gKwkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gbWFwIHBhZ2VzIGludG8gdm1hOiAl
ZFxuIiwgcmV0KTsNCj4+ICsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9DQo+PiArDQo+PiAg
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IHhlbl9kcm1fZHJ2
X3ZtX29wcyA9IHsNCj4+ICAgIAkub3BlbiAgICAgICAgICAgPSBkcm1fZ2VtX3ZtX29wZW4s
DQo+PiAgICAJLmNsb3NlICAgICAgICAgID0gZHJtX2dlbV92bV9jbG9zZSwNCj4+IEBAIC02
Nyw2ICsxMDgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNz
IHhlbl9kcm1fZnJvbnRfZ2VtX29iamVjdF9mdW5jcyA9IHsNCj4+ICAgIAkuZ2V0X3NnX3Rh
YmxlID0geGVuX2RybV9mcm9udF9nZW1fZ2V0X3NnX3RhYmxlLA0KPj4gICAgCS52bWFwID0g
eGVuX2RybV9mcm9udF9nZW1fcHJpbWVfdm1hcCwNCj4+ICAgIAkudnVubWFwID0geGVuX2Ry
bV9mcm9udF9nZW1fcHJpbWVfdnVubWFwLA0KPj4gKwkubW1hcCA9IHhlbl9kcm1fZnJvbnRf
Z2VtX29iamVjdF9tbWFwLA0KPj4gICAgCS52bV9vcHMgPSAmeGVuX2RybV9kcnZfdm1fb3Bz
LA0KPj4gICAgfTsNCj4+ICAgIA0KPj4gQEAgLTIzOCw1OCArMjgwLDYgQEAgeGVuX2RybV9m
cm9udF9nZW1faW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+PiAg
ICAJcmV0dXJuICZ4ZW5fb2JqLT5iYXNlOw0KPj4gICAgfQ0KPj4gICAgDQo+PiAtc3RhdGlj
IGludCBnZW1fbW1hcF9vYmooc3RydWN0IHhlbl9nZW1fb2JqZWN0ICp4ZW5fb2JqLA0KPj4g
LQkJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4gLXsNCj4+IC0JaW50IHJldDsN
Cj4+IC0NCj4+IC0JLyoNCj4+IC0JICogY2xlYXIgdGhlIFZNX1BGTk1BUCBmbGFnIHRoYXQg
d2FzIHNldCBieSBkcm1fZ2VtX21tYXAoKSwgYW5kIHNldCB0aGUNCj4+IC0JICogdm1fcGdv
ZmYgKHVzZWQgYXMgYSBmYWtlIGJ1ZmZlciBvZmZzZXQgYnkgRFJNKSB0byAwIGFzIHdlIHdh
bnQgdG8gbWFwDQo+PiAtCSAqIHRoZSB3aG9sZSBidWZmZXIuDQo+PiAtCSAqLw0KPj4gLQl2
bWEtPnZtX2ZsYWdzICY9IH5WTV9QRk5NQVA7DQo+PiAtCXZtYS0+dm1fZmxhZ3MgfD0gVk1f
TUlYRURNQVA7DQo+PiAtCXZtYS0+dm1fcGdvZmYgPSAwOw0KPj4gLQkvKg0KPj4gLQkgKiBB
Y2NvcmRpbmcgdG8gWGVuIG9uIEFSTSBBQkkgKHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFy
bS5oKToNCj4+IC0JICogYWxsIG1lbW9yeSB3aGljaCBpcyBzaGFyZWQgd2l0aCBvdGhlciBl
bnRpdGllcyBpbiB0aGUgc3lzdGVtDQo+PiAtCSAqIChpbmNsdWRpbmcgdGhlIGh5cGVydmlz
b3IgYW5kIG90aGVyIGd1ZXN0cykgbXVzdCByZXNpZGUgaW4gbWVtb3J5DQo+PiAtCSAqIHdo
aWNoIGlzIG1hcHBlZCBhcyBOb3JtYWwgSW5uZXIgV3JpdGUtQmFjayBPdXRlciBXcml0ZS1C
YWNrDQo+PiAtCSAqIElubmVyLVNoYXJlYWJsZS4NCj4+IC0JICovDQo+PiAtCXZtYS0+dm1f
cGFnZV9wcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKTsNCj4+IC0NCj4+
IC0JLyoNCj4+IC0JICogdm1fb3BlcmF0aW9uc19zdHJ1Y3QuZmF1bHQgaGFuZGxlciB3aWxs
IGJlIGNhbGxlZCBpZiBDUFUgYWNjZXNzDQo+PiAtCSAqIHRvIFZNIGlzIGhlcmUuIEZvciBH
UFVzIHRoaXMgaXNuJ3QgdGhlIGNhc2UsIGJlY2F1c2UgQ1BVDQo+PiAtCSAqIGRvZXNuJ3Qg
dG91Y2ggdGhlIG1lbW9yeS4gSW5zZXJ0IHBhZ2VzIG5vdywgc28gYm90aCBDUFUgYW5kIEdQ
VSBhcmUNCj4+IC0JICogaGFwcHkuDQo+PiAtCSAqIEZJWE1FOiBhcyB3ZSBpbnNlcnQgYWxs
IHRoZSBwYWdlcyBub3cgdGhlbiBubyAuZmF1bHQgaGFuZGxlciBtdXN0DQo+PiAtCSAqIGJl
IGNhbGxlZCwgc28gZG9uJ3QgcHJvdmlkZSBvbmUNCj4+IC0JICovDQo+PiAtCXJldCA9IHZt
X21hcF9wYWdlcyh2bWEsIHhlbl9vYmotPnBhZ2VzLCB4ZW5fb2JqLT5udW1fcGFnZXMpOw0K
Pj4gLQlpZiAocmV0IDwgMCkNCj4+IC0JCURSTV9FUlJPUigiRmFpbGVkIHRvIG1hcCBwYWdl
cyBpbnRvIHZtYTogJWRcbiIsIHJldCk7DQo+PiAtDQo+PiAtCXJldHVybiByZXQ7DQo+PiAt
fQ0KPj4gLQ0KPj4gLWludCB4ZW5fZHJtX2Zyb250X2dlbV9tbWFwKHN0cnVjdCBmaWxlICpm
aWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4+IC17DQo+PiAtCXN0cnVjdCB4
ZW5fZ2VtX29iamVjdCAqeGVuX29iajsNCj4+IC0Jc3RydWN0IGRybV9nZW1fb2JqZWN0ICpn
ZW1fb2JqOw0KPj4gLQlpbnQgcmV0Ow0KPj4gLQ0KPj4gLQlyZXQgPSBkcm1fZ2VtX21tYXAo
ZmlscCwgdm1hKTsNCj4+IC0JaWYgKHJldCA8IDApDQo+PiAtCQlyZXR1cm4gcmV0Ow0KPj4g
LQ0KPj4gLQlnZW1fb2JqID0gdm1hLT52bV9wcml2YXRlX2RhdGE7DQo+PiAtCXhlbl9vYmog
PSB0b194ZW5fZ2VtX29iaihnZW1fb2JqKTsNCj4+IC0JcmV0dXJuIGdlbV9tbWFwX29iaih4
ZW5fb2JqLCB2bWEpOw0KPj4gLX0NCj4+IC0NCj4+ICAgIGludCB4ZW5fZHJtX2Zyb250X2dl
bV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtX29iaiwgc3RydWN0IGRt
YV9idWZfbWFwICptYXApDQo+PiAgICB7DQo+PiAgICAJc3RydWN0IHhlbl9nZW1fb2JqZWN0
ICp4ZW5fb2JqID0gdG9feGVuX2dlbV9vYmooZ2VtX29iaik7DQo+PiBAQCAtMzEzLDE3ICsz
MDMsMyBAQCB2b2lkIHhlbl9kcm1fZnJvbnRfZ2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKmdlbV9vYmosDQo+PiAgICB7DQo+PiAgICAJdnVubWFwKG1hcC0+dmFk
ZHIpOw0KPj4gICAgfQ0KPj4gLQ0KPj4gLWludCB4ZW5fZHJtX2Zyb250X2dlbV9wcmltZV9t
bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtX29iaiwNCj4+IC0JCQkJIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4gLXsNCj4+IC0Jc3RydWN0IHhlbl9nZW1fb2JqZWN0
ICp4ZW5fb2JqOw0KPj4gLQlpbnQgcmV0Ow0KPj4gLQ0KPj4gLQlyZXQgPSBkcm1fZ2VtX21t
YXBfb2JqKGdlbV9vYmosIGdlbV9vYmotPnNpemUsIHZtYSk7DQo+PiAtCWlmIChyZXQgPCAw
KQ0KPj4gLQkJcmV0dXJuIHJldDsNCj4+IC0NCj4+IC0JeGVuX29iaiA9IHRvX3hlbl9nZW1f
b2JqKGdlbV9vYmopOw0KPj4gLQlyZXR1cm4gZ2VtX21tYXBfb2JqKHhlbl9vYmosIHZtYSk7
DQo+PiAtfQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9m
cm9udF9nZW0uaCBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uaA0K
Pj4gaW5kZXggYTRlNjdkMGExNDljLi5lYWVhNDcwZjcwMDEgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfZ2VtLmgNCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uaA0KPj4gQEAgLTE1LDkgKzE1LDcg
QEAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudDsNCj4+ICAgIHN0cnVjdCBkbWFfYnVmX21h
cDsNCj4+ICAgIHN0cnVjdCBkcm1fZGV2aWNlOw0KPj4gICAgc3RydWN0IGRybV9nZW1fb2Jq
ZWN0Ow0KPj4gLXN0cnVjdCBmaWxlOw0KPj4gICAgc3RydWN0IHNnX3RhYmxlOw0KPj4gLXN0
cnVjdCB2bV9hcmVhX3N0cnVjdDsNCj4+ICAgIA0KPj4gICAgc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICp4ZW5fZHJtX2Zyb250X2dlbV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwN
Cj4+ICAgIAkJCQkJCXNpemVfdCBzaXplKTsNCj4+IEBAIC0zMywxNSArMzEsMTAgQEAgc3Ry
dWN0IHBhZ2UgKip4ZW5fZHJtX2Zyb250X2dlbV9nZXRfcGFnZXMoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICpvYmopOw0KPj4gICAgDQo+PiAgICB2b2lkIHhlbl9kcm1fZnJvbnRfZ2VtX2Zy
ZWVfb2JqZWN0X3VubG9ja2VkKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtX29iaik7DQo+
PiAgICANCj4+IC1pbnQgeGVuX2RybV9mcm9udF9nZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmls
cCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOw0KPj4gLQ0KPj4gICAgaW50IHhlbl9k
cm1fZnJvbnRfZ2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnZW1fb2Jq
LA0KPj4gICAgCQkJCSBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCk7DQo+PiAgICANCj4+ICAg
IHZvaWQgeGVuX2RybV9mcm9udF9nZW1fcHJpbWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqZ2VtX29iaiwNCj4+ICAgIAkJCQkgICAgc3RydWN0IGRtYV9idWZfbWFwICptYXAp
Ow0KPj4gICAgDQo+PiAtaW50IHhlbl9kcm1fZnJvbnRfZ2VtX3ByaW1lX21tYXAoc3RydWN0
IGRybV9nZW1fb2JqZWN0ICpnZW1fb2JqLA0KPj4gLQkJCQkgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEpOw0KPj4gLQ0KPj4gICAgI2VuZGlmIC8qIF9fWEVOX0RSTV9GUk9OVF9HRU1f
SCAqLw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------pNvdFciOihALwXILgN9Us0jY--

--------------0AOeEutgkiNVV1IRkB2IcmOG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGJCtcFAwAAAAAACgkQlh/E3EQov+BZ
qw/7BLeIuL6WUgp6Qs/ZQ0toVekaxurcrG7woL350aDjl+TZWnjiOoxvo45WNqVmH+rRKWT12nQQ
nYbuHkC96Ptu2T9R2lkn3kO2yagdXQ3fw3M/k2pSOUpQGUk/WPg0bWvD7AJsvYJDggcVNcneDqkG
WXfuz3xRiRfF3oa5m4VWgjsF57WlUhsATSMuXFPp18vPWLZwQOcbvAtmZpAJD4e0I1L9a9csRm/y
xoFslKdJ0oWinWfElQO0VG4hC2ZLW1T5Vh90IP/zd04jFN9uK9nHh8s5MjSOgfRhQjfRAoTKrF1Z
5/W4WJCJyFT6f+BV/Bmz+xrLGvBPXjOvOsk8nppg2VE8IiKm+pbbK1eVuS808upoxP/B4Ght5vzx
EhqZX3/u+H9CowRngtAAR0b839ERt2zsgpcBC/cbSpuMhwJ6jkN7yQM7IoDLcnRPC5mKqWz+HfvS
yea9h3TTdemx2GpfyMoJU44Uu9Jh3tIAslQeSdVJQHiY/64ZxKTlZ1WGkVwncfBMRYeKL3Plmbqk
sSgOqdP3oiZtQYy19t/btCqi3wL8vQoHrz7nWjjXPas8JbTWvIjcP2afA2IIM3ubE1ks7SjY2djw
q/y+Wv+Kh4smykIyYYzLZNiG61SQ77URKTUsXxAc+/rdR0c4lAcQQVNxjU3AkGUMZH5ZjEwjDQcQ
muE=
=hT8R
-----END PGP SIGNATURE-----

--------------0AOeEutgkiNVV1IRkB2IcmOG--
