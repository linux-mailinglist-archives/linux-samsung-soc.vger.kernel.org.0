Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF1C44AAC5
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Nov 2021 10:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244980AbhKIJrc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 9 Nov 2021 04:47:32 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:43754 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244968AbhKIJrb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 04:47:31 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 256891FDB7;
        Tue,  9 Nov 2021 09:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1636451085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QNzvRbJxR15JRDglvCH3sXpReZaqm6Qly3fbmhVsgzM=;
        b=NAbovM6ES0+16uvsoshG2BGc4FqTkZwepR7nCxoqb/SIbtWbasjvW7DBazsx3CCQt1EOXc
        FFT9shrbey0FRHgp+Q4x3XeIk1V9Uq27YtqwlNNwj0Hy1n5GEXJOv1f7K+yCfu88tOUyLm
        HIQPw1K3yQlUSt7y5hpT4g7RuWEkz7s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1636451085;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=QNzvRbJxR15JRDglvCH3sXpReZaqm6Qly3fbmhVsgzM=;
        b=0DlDyJUa3vTpCahKGMPRilUvuZDiG5ECr/Xo0ZXJhHsTIm+/xiDYTgF7l0jaqCmd2ELJtd
        U8o1i3dRRCy92eBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D44D9133D1;
        Tue,  9 Nov 2021 09:44:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id iarBMgxDimH+XAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 09 Nov 2021 09:44:44 +0000
Message-ID: <127971f3-ad26-d40f-4ea2-669c8ae18964@suse.de>
Date:   Tue, 9 Nov 2021 10:44:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/3] drm/exynox: Implement mmap as GEM object function
Content-Language: en-US
To:     Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        krzysztof.kozlowski@canonical.com, airlied@linux.ie,
        oleksandr_andrushchenko@epam.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org,
        xen-devel@lists.xenproject.org,
        linux-arm-kernel@lists.infradead.org
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-2-tzimmermann@suse.de>
 <CGME20211108152930epcas1p4e61b02b1151ba4779949d81312597a08@epcas1p4.samsung.com>
 <YYlCUOgd1/GBluE7@phenom.ffwll.local>
 <10fcb430-b051-20f0-b0c0-3f54285e01ce@samsung.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <10fcb430-b051-20f0-b0c0-3f54285e01ce@samsung.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7X4FDPPqD0rrr6V0bREDUp5Q"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7X4FDPPqD0rrr6V0bREDUp5Q
Content-Type: multipart/mixed; boundary="------------dDNcv4hgldp269ntTlcuR5df";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Inki Dae <inki.dae@samsung.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, airlied@linux.ie,
 oleksandr_andrushchenko@epam.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, dri-devel@lists.freedesktop.org,
 xen-devel@lists.xenproject.org, linux-arm-kernel@lists.infradead.org
Message-ID: <127971f3-ad26-d40f-4ea2-669c8ae18964@suse.de>
Subject: Re: [PATCH 1/3] drm/exynox: Implement mmap as GEM object function
References: <20211108102846.309-1-tzimmermann@suse.de>
 <20211108102846.309-2-tzimmermann@suse.de>
 <CGME20211108152930epcas1p4e61b02b1151ba4779949d81312597a08@epcas1p4.samsung.com>
 <YYlCUOgd1/GBluE7@phenom.ffwll.local>
 <10fcb430-b051-20f0-b0c0-3f54285e01ce@samsung.com>
In-Reply-To: <10fcb430-b051-20f0-b0c0-3f54285e01ce@samsung.com>

--------------dDNcv4hgldp269ntTlcuR5df
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMTEuMjEgdW0gMTA6MzQgc2NocmllYiBJbmtpIERhZToNCj4gSGkgVGhv
bWFzIGFuZCBEYW5pZWwsDQo+IA0KPiAyMS4gMTEuIDkuIOyYpOyghCAxMjoyOeyXkCBEYW5p
ZWwgVmV0dGVyIOydtCjqsIApIOyTtCDquIA6DQo+PiBPbiBNb24sIE5vdiAwOCwgMjAyMSBh
dCAxMToyODo0NEFNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+PiBNb3Zp
bmcgdGhlIGRyaXZlci1zcGVjaWZpYyBtbWFwIGNvZGUgaW50byBhIEdFTSBvYmplY3QgZnVu
Y3Rpb24gYWxsb3dzDQo+Pj4gZm9yIHVzaW5nIERSTSBoZWxwZXJzIGZvciB2YXJpb3VzIG1t
YXAgY2FsbGJhY2tzLg0KPj4+DQo+Pj4gVGhlIHJlc3BlY3RpdmUgZXh5bm9zIGZ1bmN0aW9u
cyBhcmUgYmVpbmcgcmVtb3ZlZC4gVGhlIGZpbGVfb3BlcmF0aW9ucw0KPj4+IHN0cnVjdHVy
ZSBleHlub3NfZHJtX2RyaXZlcl9mb3BzIGlzIG5vdyBiZWluZyBjcmVhdGVkIGJ5IHRoZSBo
ZWxwZXIgbWFjcm8NCj4+PiBERUZJTkVfRFJNX0dFTV9GT1BTKCkuDQo+Pj4NCj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+
DQo+PiBzL2V4eW5veC9leHlub3MgaW4gdGhlIHN1YmplY3QuDQo+Pg0KPj4gUGF0Y2ggbGd0
bSwgYnV0IHdvdWxkIHN0aWxsIGJlIGdvb2QgaWYgZXh5bm9zIG1haW50YWluZXJzIHdvdWxk
DQo+PiBhY2svcmV2aWV3L3Rlc3QgaXQuIEJ1dCBpZiB5b3UgZG9uJ3QgZ2V0IGFueXRoaW5n
IHdpdGhpbiAyIHdlZWtzIGhlcmUncw0KPiANCj4gU29ycnkgZm9yIGxhdGUuIENvbmZpcm1l
ZCB3b3JraW5nIHdlbGwgb24gT2Ryb2lkIGJvYXJkLCBhbmQgaGFkIGEgcmV2aWV3LiBBcHBs
aWVkLg0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9kYWVpbmtpL2RybS1leHlub3MuZ2l0L2xvZy8/aD1leHlub3MtZHJtLW5leHQNCg0KVGhh
bmtzIGEgbG90IQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBUaGFua3MsDQo+
IElua2kgRGFlDQo+IA0KPj4gbXk6DQo+Pg0KPj4gQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+Pg0KPj4+IC0tLQ0KPj4+ICAgZHJpdmVycy9n
cHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jICAgfCAxMyArKy0tLS0tDQo+Pj4gICBk
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyB8IDIwICsrLS0tLS0t
LS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMgICB8
IDQzICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZ2VtLmggICB8ICA1IC0tLQ0KPj4+ICAgNCBmaWxlcyBjaGFuZ2Vk
LCAxMyBpbnNlcnRpb25zKCspLCA2OCBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMNCj4+PiBpbmRleCBkOGYxY2Y0ZDZi
NjkuLjk3NDNiNmIxNzQ0NyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZHJ2LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZHJ2LmMNCj4+PiBAQCAtMTAyLDE2ICsxMDIsNyBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9pb2N0bF9kZXNjIGV4eW5vc19pb2N0bHNbXSA9IHsNCj4+PiAgIAkJ
CURSTV9SRU5ERVJfQUxMT1cpLA0KPj4+ICAgfTsNCj4+PiAgIA0KPj4+IC1zdGF0aWMgY29u
c3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBleHlub3NfZHJtX2RyaXZlcl9mb3BzID0gew0K
Pj4+IC0JLm93bmVyCQk9IFRISVNfTU9EVUxFLA0KPj4+IC0JLm9wZW4JCT0gZHJtX29wZW4s
DQo+Pj4gLQkubW1hcAkJPSBleHlub3NfZHJtX2dlbV9tbWFwLA0KPj4+IC0JLnBvbGwJCT0g
ZHJtX3BvbGwsDQo+Pj4gLQkucmVhZAkJPSBkcm1fcmVhZCwNCj4+PiAtCS51bmxvY2tlZF9p
b2N0bAk9IGRybV9pb2N0bCwNCj4+PiAtCS5jb21wYXRfaW9jdGwgPSBkcm1fY29tcGF0X2lv
Y3RsLA0KPj4+IC0JLnJlbGVhc2UJPSBkcm1fcmVsZWFzZSwNCj4+PiAtfTsNCj4+PiArREVG
SU5FX0RSTV9HRU1fRk9QUyhleHlub3NfZHJtX2RyaXZlcl9mb3BzKTsNCj4+PiAgIA0KPj4+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyIGV4eW5vc19kcm1fZHJpdmVyID0g
ew0KPj4+ICAgCS5kcml2ZXJfZmVhdHVyZXMJPSBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9H
RU0NCj4+PiBAQCAtMTI0LDcgKzExNSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Ry
aXZlciBleHlub3NfZHJtX2RyaXZlciA9IHsNCj4+PiAgIAkucHJpbWVfZmRfdG9faGFuZGxl
CT0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsDQo+Pj4gICAJLmdlbV9wcmltZV9pbXBv
cnQJPSBleHlub3NfZHJtX2dlbV9wcmltZV9pbXBvcnQsDQo+Pj4gICAJLmdlbV9wcmltZV9p
bXBvcnRfc2dfdGFibGUJPSBleHlub3NfZHJtX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUs
DQo+Pj4gLQkuZ2VtX3ByaW1lX21tYXAJCT0gZXh5bm9zX2RybV9nZW1fcHJpbWVfbW1hcCwN
Cj4+PiArCS5nZW1fcHJpbWVfbW1hcAkJPSBkcm1fZ2VtX3ByaW1lX21tYXAsDQo+Pj4gICAJ
LmlvY3RscwkJCT0gZXh5bm9zX2lvY3RscywNCj4+PiAgIAkubnVtX2lvY3RscwkJPSBBUlJB
WV9TSVpFKGV4eW5vc19pb2N0bHMpLA0KPj4+ICAgCS5mb3BzCQkJPSAmZXh5bm9zX2RybV9k
cml2ZXJfZm9wcywNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2ZiZGV2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
ZmJkZXYuYw0KPj4+IGluZGV4IDUxNDdmNTkyOWJlNy4uMDJjOTdiOWNhOTI2IDEwMDY0NA0K
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jDQo+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMNCj4+
PiBAQCAtMTUsNiArMTUsNyBAQA0KPj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPg0K
Pj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+DQo+Pj4gICAjaW5jbHVkZSA8
ZHJtL2RybV9mb3VyY2MuaD4NCj4+PiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbWUuaD4NCj4+
PiAgICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPg0KPj4+ICAgI2luY2x1ZGUg
PGRybS9leHlub3NfZHJtLmg+DQo+Pj4gICANCj4+PiBAQCAtMzksMjUgKzQwLDggQEAgc3Rh
dGljIGludCBleHlub3NfZHJtX2ZiX21tYXAoc3RydWN0IGZiX2luZm8gKmluZm8sDQo+Pj4g
ICAJc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciA9IGluZm8tPnBhcjsNCj4+PiAgIAlz
dHJ1Y3QgZXh5bm9zX2RybV9mYmRldiAqZXh5bm9zX2ZiZCA9IHRvX2V4eW5vc19mYmRldiho
ZWxwZXIpOw0KPj4+ICAgCXN0cnVjdCBleHlub3NfZHJtX2dlbSAqZXh5bm9zX2dlbSA9IGV4
eW5vc19mYmQtPmV4eW5vc19nZW07DQo+Pj4gLQl1bnNpZ25lZCBsb25nIHZtX3NpemU7DQo+
Pj4gLQlpbnQgcmV0Ow0KPj4+IC0NCj4+PiAtCXZtYS0+dm1fZmxhZ3MgfD0gVk1fSU8gfCBW
TV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7DQo+Pj4gLQ0KPj4+IC0Jdm1fc2l6ZSA9IHZt
YS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydDsNCj4+PiAtDQo+Pj4gLQlpZiAodm1fc2l6ZSA+
IGV4eW5vc19nZW0tPnNpemUpDQo+Pj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+Pj4gICANCj4+
PiAtCXJldCA9IGRtYV9tbWFwX2F0dHJzKHRvX2RtYV9kZXYoaGVscGVyLT5kZXYpLCB2bWEs
IGV4eW5vc19nZW0tPmNvb2tpZSwNCj4+PiAtCQkJICAgICBleHlub3NfZ2VtLT5kbWFfYWRk
ciwgZXh5bm9zX2dlbS0+c2l6ZSwNCj4+PiAtCQkJICAgICBleHlub3NfZ2VtLT5kbWFfYXR0
cnMpOw0KPj4+IC0JaWYgKHJldCA8IDApIHsNCj4+PiAtCQlEUk1fREVWX0VSUk9SKHRvX2Rt
YV9kZXYoaGVscGVyLT5kZXYpLCAiZmFpbGVkIHRvIG1tYXAuXG4iKTsNCj4+PiAtCQlyZXR1
cm4gcmV0Ow0KPj4+IC0JfQ0KPj4+IC0NCj4+PiAtCXJldHVybiAwOw0KPj4+ICsJcmV0dXJu
IGRybV9nZW1fcHJpbWVfbW1hcCgmZXh5bm9zX2dlbS0+YmFzZSwgdm1hKTsNCj4+PiAgIH0N
Cj4+PiAgIA0KPj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgZXh5bm9zX2RybV9m
Yl9vcHMgPSB7DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0u
Yw0KPj4+IGluZGV4IDQzOTYyMjQyMjdkMS4uYzRiNjM5MDJlZTdhIDEwMDY0NA0KPj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYw0KPj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYw0KPj4+IEBAIC0xNyw2
ICsxNyw4IEBADQo+Pj4gICAjaW5jbHVkZSAiZXh5bm9zX2RybV9kcnYuaCINCj4+PiAgICNp
bmNsdWRlICJleHlub3NfZHJtX2dlbS5oIg0KPj4+ICAgDQo+Pj4gK3N0YXRpYyBpbnQgZXh5
bm9zX2RybV9nZW1fbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEpOw0KPj4+ICsNCj4+PiAgIHN0YXRpYyBpbnQgZXh5bm9zX2Ry
bV9hbGxvY19idWYoc3RydWN0IGV4eW5vc19kcm1fZ2VtICpleHlub3NfZ2VtLCBib29sIGt2
bWFwKQ0KPj4+ICAgew0KPj4+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBleHlub3Nf
Z2VtLT5iYXNlLmRldjsNCj4+PiBAQCAtMTM1LDYgKzEzNyw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgZXh5bm9zX2RybV9nZW1fdm1fb3BzID0gew0K
Pj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyBleHlub3Nf
ZHJtX2dlbV9vYmplY3RfZnVuY3MgPSB7DQo+Pj4gICAJLmZyZWUgPSBleHlub3NfZHJtX2dl
bV9mcmVlX29iamVjdCwNCj4+PiAgIAkuZ2V0X3NnX3RhYmxlID0gZXh5bm9zX2RybV9nZW1f
cHJpbWVfZ2V0X3NnX3RhYmxlLA0KPj4+ICsJLm1tYXAgPSBleHlub3NfZHJtX2dlbV9tbWFw
LA0KPj4+ICAgCS52bV9vcHMgPSAmZXh5bm9zX2RybV9nZW1fdm1fb3BzLA0KPj4+ICAgfTsN
Cj4+PiAgIA0KPj4+IEBAIC0zNTQsMTIgKzM1NywxNiBAQCBpbnQgZXh5bm9zX2RybV9nZW1f
ZHVtYl9jcmVhdGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsDQo+Pj4gICAJcmV0dXJu
IDA7DQo+Pj4gICB9DQo+Pj4gICANCj4+PiAtc3RhdGljIGludCBleHlub3NfZHJtX2dlbV9t
bWFwX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwNCj4+PiAtCQkJCSAgIHN0cnVj
dCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4+ICtzdGF0aWMgaW50IGV4eW5vc19kcm1fZ2Vt
X21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVj
dCAqdm1hKQ0KPj4+ICAgew0KPj4+ICAgCXN0cnVjdCBleHlub3NfZHJtX2dlbSAqZXh5bm9z
X2dlbSA9IHRvX2V4eW5vc19nZW0ob2JqKTsNCj4+PiAgIAlpbnQgcmV0Ow0KPj4+ICAgDQo+
Pj4gKwlpZiAob2JqLT5pbXBvcnRfYXR0YWNoKQ0KPj4+ICsJCXJldHVybiBkbWFfYnVmX21t
YXAob2JqLT5kbWFfYnVmLCB2bWEsIDApOw0KPj4+ICsNCj4+PiArCXZtYS0+dm1fZmxhZ3Mg
fD0gVk1fSU8gfCBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7DQo+Pj4gKw0KPj4+ICAg
CURSTV9ERVZfREVCVUdfS01TKHRvX2RtYV9kZXYob2JqLT5kZXYpLCAiZmxhZ3MgPSAweCV4
XG4iLA0KPj4+ICAgCQkJICBleHlub3NfZ2VtLT5mbGFncyk7DQo+Pj4gICANCj4+PiBAQCAt
Mzg1LDI2ICszOTIsNiBAQCBzdGF0aWMgaW50IGV4eW5vc19kcm1fZ2VtX21tYXBfb2JqKHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLA0KPj4+ICAgCXJldHVybiByZXQ7DQo+Pj4gICB9
DQo+Pj4gICANCj4+PiAtaW50IGV4eW5vc19kcm1fZ2VtX21tYXAoc3RydWN0IGZpbGUgKmZp
bHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4+IC17DQo+Pj4gLQlzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iajsNCj4+PiAtCWludCByZXQ7DQo+Pj4gLQ0KPj4+IC0JLyog
c2V0IHZtX2FyZWFfc3RydWN0LiAqLw0KPj4+IC0JcmV0ID0gZHJtX2dlbV9tbWFwKGZpbHAs
IHZtYSk7DQo+Pj4gLQlpZiAocmV0IDwgMCkgew0KPj4+IC0JCURSTV9FUlJPUigiZmFpbGVk
IHRvIG1tYXAuXG4iKTsNCj4+PiAtCQlyZXR1cm4gcmV0Ow0KPj4+IC0JfQ0KPj4+IC0NCj4+
PiAtCW9iaiA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOw0KPj4+IC0NCj4+PiAtCWlmIChvYmot
PmltcG9ydF9hdHRhY2gpDQo+Pj4gLQkJcmV0dXJuIGRtYV9idWZfbW1hcChvYmotPmRtYV9i
dWYsIHZtYSwgMCk7DQo+Pj4gLQ0KPj4+IC0JcmV0dXJuIGV4eW5vc19kcm1fZ2VtX21tYXBf
b2JqKG9iaiwgdm1hKTsNCj4+PiAtfQ0KPj4+IC0NCj4+PiAgIC8qIGxvdy1sZXZlbCBpbnRl
cmZhY2UgcHJpbWUgaGVscGVycyAqLw0KPj4+ICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpl
eHlub3NfZHJtX2dlbV9wcmltZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+
PiAgIAkJCQkJICAgIHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmKQ0KPj4+IEBAIC00NjYsMTUg
KzQ1MywzIEBAIGV4eW5vc19kcm1fZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LA0KPj4+ICAgCWV4eW5vc19nZW0tPnNndCA9IHNndDsNCj4+PiAg
IAlyZXR1cm4gJmV4eW5vc19nZW0tPmJhc2U7DQo+Pj4gICB9DQo+Pj4gLQ0KPj4+IC1pbnQg
ZXh5bm9zX2RybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwN
Cj4+PiAtCQkJICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpDQo+Pj4gLXsNCj4+
PiAtCWludCByZXQ7DQo+Pj4gLQ0KPj4+IC0JcmV0ID0gZHJtX2dlbV9tbWFwX29iaihvYmos
IG9iai0+c2l6ZSwgdm1hKTsNCj4+PiAtCWlmIChyZXQgPCAwKQ0KPj4+IC0JCXJldHVybiBy
ZXQ7DQo+Pj4gLQ0KPj4+IC0JcmV0dXJuIGV4eW5vc19kcm1fZ2VtX21tYXBfb2JqKG9iaiwg
dm1hKTsNCj4+PiAtfQ0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZ2VtLmggYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
Z2VtLmgNCj4+PiBpbmRleCBhMjMyNzJmYjk2ZmIuLjc5ZDdlMWE4NzQxOSAxMDA2NDQNCj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmgNCj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmgNCj4+PiBAQCAt
OTYsOSArOTYsNiBAQCBpbnQgZXh5bm9zX2RybV9nZW1fZHVtYl9jcmVhdGUoc3RydWN0IGRy
bV9maWxlICpmaWxlX3ByaXYsDQo+Pj4gICAJCQkgICAgICAgc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwNCj4+PiAgIAkJCSAgICAgICBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1bWIgKmFy
Z3MpOw0KPj4+ICAgDQo+Pj4gLS8qIHNldCB2bV9mbGFncyBhbmQgd2UgY2FuIGNoYW5nZSB0
aGUgdm0gYXR0cmlidXRlIHRvIG90aGVyIG9uZSBhdCBoZXJlLiAqLw0KPj4+IC1pbnQgZXh5
bm9zX2RybV9nZW1fbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEpOw0KPj4+IC0NCj4+PiAgIC8qIGxvdy1sZXZlbCBpbnRlcmZhY2UgcHJpbWUg
aGVscGVycyAqLw0KPj4+ICAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpleHlub3NfZHJtX2dl
bV9wcmltZV9pbXBvcnQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+PiAgIAkJCQkJICAg
IHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmKTsNCj4+PiBAQCAtMTA3LDcgKzEwNCw1IEBAIHN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqDQo+Pj4gICBleHlub3NfZHJtX2dlbV9wcmltZV9pbXBv
cnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4+PiAgIAkJCQkgICAgIHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4+PiAgIAkJCQkgICAgIHN0cnVj
dCBzZ190YWJsZSAqc2d0KTsNCj4+PiAtaW50IGV4eW5vc19kcm1fZ2VtX3ByaW1lX21tYXAo
c3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosDQo+Pj4gLQkJCSAgICAgIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKTsNCj4+PiAgIA0KPj4+ICAgI2VuZGlmDQo+Pj4gLS0gDQo+Pj4g
Mi4zMy4xDQo+Pj4NCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------dDNcv4hgldp269ntTlcuR5df--

--------------7X4FDPPqD0rrr6V0bREDUp5Q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGKQwwFAwAAAAAACgkQlh/E3EQov+DZ
1g//RV9k/Hqxg2dVXIzHtfKGwZLb4sFbh/3qbJd0ioj5RJgSLlz52loz6HNPhKpbGHsLoHtILwNs
P30yHFeRXmkMsvUlA6AOQPe9N3rwZsUBCqN6f2nkyy7M69vh3teBqX5uVj/rIz59ZzLoR0Z/yIwV
O7sQ5N9qYrHFtHJKYGDYX2mVmoSfeq5M+JiwS/YiTwvg0IvZ1XH46XfX4cAlK24ZtonJdfLaBDbk
MSrv8UJEccBax6cl4LrMwnqVUqbmw3cVKBFPUCOzqpvECWc06n8YmCjN5T2UABFVzSv6AAOE/l25
j2y2U0E6boFD2jcreZg0jwFRDqXpnxOJSN6Is+Ugrk7K0BsNbCcKanUG1IZlLdxr0y9991WZvqD3
Ee4xugz17c4TsV18ux4N2Xjvl4/vUVKjewqGwvxMCCwHNmLSiz4Yr+4u4g8qFwRaE/cXSN3AxV/A
3mMSCRWzzpcqiwJSnFNvdCGwkkfPjFQTFDUMTn6mrFMzyJ+MVUjheOubILAoP22d8c72nY4TI5Fr
dbXi5ueT0l0cyy24mXeRk1ax07PXigWDyTJ4ovqCtDsebdo53tCeJBX6nNPPtfB+l03TNxuLdpvB
b5g9+X4cTxYfoyS/8kKmZUDRuRiIy83sXH5fUyE3oPtz2JWCyjV9obi9C4OoryvNYUVObbNEntLs
wZc=
=Bk4U
-----END PGP SIGNATURE-----

--------------7X4FDPPqD0rrr6V0bREDUp5Q--
