Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 307D069A6BE
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Feb 2023 09:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbjBQIS7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Feb 2023 03:18:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBQIS6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 03:18:58 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939981729;
        Fri, 17 Feb 2023 00:18:56 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 346B41FDB1;
        Fri, 17 Feb 2023 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1676621935; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ch+F+7eCo/PJGNudGtuNAN+c7OQK5KCwKOoUgQiycZc=;
        b=Um7qp+R9bXGMH3qsem5no/UR+u7A6YJrgHOnwGVmgR6r14VlKw/rfYo26vhDg/fUIsfKDI
        T+OBNIy3p4tR5U4Qatft0oLt5AOQgnR/ocM/D8AeB8asMnrj2CxmBLBLseLjbCJ6/EfrP1
        qzZxS4LiOkCFDmCSnB8m7+LfvQ/CKCA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1676621935;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Ch+F+7eCo/PJGNudGtuNAN+c7OQK5KCwKOoUgQiycZc=;
        b=ciGJES4GUVkE2im1ezAnrOwj8Ha5EgY1LIszG6Sot4j0D9tAvXjqTESqTDGckEJixT7hMA
        0S0Tdnb72q6dlOAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5F3113274;
        Fri, 17 Feb 2023 08:18:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id LvU2N24472PkeQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 08:18:54 +0000
Message-ID: <a9a85066-6f48-5cc5-550f-b6f301a16b00@suse.de>
Date:   Fri, 17 Feb 2023 09:18:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     javierm@redhat.com, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20230216140620.17699-1-tzimmermann@suse.de>
 <Y+6OCAJ9wyE1PfAw@phenom.ffwll.local>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y+6OCAJ9wyE1PfAw@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PB0l0H7GsZYN00xVZ8W6EuRY"
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PB0l0H7GsZYN00xVZ8W6EuRY
Content-Type: multipart/mixed; boundary="------------M4H0F7TbJNxCTGnxSAcxT4xQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: javierm@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Message-ID: <a9a85066-6f48-5cc5-550f-b6f301a16b00@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Remove drm_fb_helper_unprepare() from
 drm_fb_helper_fini()
References: <20230216140620.17699-1-tzimmermann@suse.de>
 <Y+6OCAJ9wyE1PfAw@phenom.ffwll.local>
In-Reply-To: <Y+6OCAJ9wyE1PfAw@phenom.ffwll.local>

--------------M4H0F7TbJNxCTGnxSAcxT4xQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDIuMjMgdW0gMjE6MTEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIEZlYiAxNiwgMjAyMyBhdCAwMzowNjoyMFBNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IE1vdmUgZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUoKSBmcm9tIGRy
bV9mYl9oZWxwZXJfZmluaSgpIGludG8gdGhlDQo+PiBjYWxsaW5nIGZiZGV2IGltcGxlbWVu
dGF0aW9uLiBBdm9pZHMgYSBwb3NzaWJsZSBzdGFsZSBtdXRleCB3aXRoDQo+PiBnZW5lcmlj
IGZiZGV2IGNvZGUuDQo+Pg0KPj4gQXMgaW5kaWNhdGVkIGJ5IGl0cyBuYW1lLCBkcm1fZmJf
aGVscGVyX3ByZXBhcmUoKSBwcmVwYXJlcyBzdHJ1Y3QNCj4+IGRybV9mYl9oZWxwZXIgYmVm
b3JlIHNldHRpbmcgdXAgdGhlIGZiZGV2IHN1cHBvcnQgd2l0aCBhIGNhbGwgdG8NCj4+IGRy
bV9mYl9oZWxwZXJfaW5pdCgpLiBJbiBsZWdhY3kgZmJkZXYgZW11bGF0aW9uLCB0aGlzIGhh
cHBlbnMgbmV4dA0KPj4gdG8gZWFjaCBvdGhlci4gSWYgc3VjY2Vzc2Z1bCwgZHJtX2ZiX2hl
bHBlcl9maW5pKCkgbGF0ZXIgdGVhciBkb3duDQo+PiB0aGUgZmJkZXYgZGV2aWNlIGFuZCBh
bHNvIHVucHJlcGFyZSB2aWEgZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUoKS4NCj4+DQo+PiBH
ZW5lcmljIGZiZGV2IGVtdWxhdGlvbiBwcmVwYXJlcyBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciBp
bW1lZGlhdGVseQ0KPj4gYWZ0ZXIgYWxsb2NhdGluZyB0aGUgaW5zdGFuY2UuIEl0IG9ubHkg
Y2FsbHMgZHJtX2ZiX2hlbHBlcl9pbml0KCkNCj4+IGFzIHBhcnQgb2YgcHJvY2Vzc2luZyBh
IGhvdHBsdWcgZXZlbnQuIElmIHRoZSBob3RwbHVnLWhhbmRsaW5nIGZhaWxzLA0KPj4gaXQg
cnVucyBkcm1fZmJfaGVscGVyX2ZpbmkoKS4gVGhpcyB1bnByZXBhcmVzIHRoZSBmYi1oZWxw
ZXIgaW5zdGFuY2UNCj4+IGFuZCB0aGUgbmV4dCBob3RwbHVnIGV2ZW50IHJ1bnMgb24gc3Rh
bGUgZGF0YS4NCj4+DQo+PiBTb2x2ZSB0aGlzIGJ5IG1vdmluZyBkcm1fZmJfaGVscGVyX3Vu
cHJlcGFyZSgpIGZyb20gZHJtX2ZiX2hlbHBlcl9maW5pKCkNCj4+IGludG8gdGhlIGZiZGV2
IGltcGxlbWVudGF0aW9ucy4gQ2FsbCBpdCByaWdodCBiZWZvcmUgZnJlZWluZyB0aGUNCj4+
IGZiLWhlbHBlciBpbnN0YW5jZS4NCj4+DQo+PiBGaXhlczogNDgyNTc5N2MzNmRhICgiZHJt
L2ZiLWhlbHBlcjogSW50cm9kdWNlIGRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKCkiKQ0KPj4g
Q2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gQ2M6IEph
dmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4gQ2M6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+
PiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPj4gQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+DQo+PiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPg0KPj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4gDQo+IFRoaXMgcmVtaW5kcyBtZSBvZiBhbiBvbGQgcGF0Y2ggSSBqdXN0
IHJlY2VudGx5IHN0dW1ibGVkIG92ZXIgYWdhaW46DQo+IA0KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9kcmktZGV2ZWwvWTNTdDJWSEo3akVtY05Gd0BwaGVub20uZmZ3bGwubG9jYWwv
DQo+IA0KPiBTaG91bGQgSSByZXN1cnJlY3QgdGhhdCBvbmUgbWF5YmUgYW5kIHNlbmQgaXQg
b3V0PyBJIHRoaW5rIHRoYXQgYWxzbyB0aWVzDQo+IGEgYml0IGludG8geW91ciBzdG9yeSBo
ZXJlLg0KDQpJIGRvbid0IHRoaW5rIGl0IHdpbGwgYmUgbmVjZXNzYXJ5LiBJIGJlZ2FuIHRv
IGNvbnZlcnQgdGhlIGV4aXN0aW5nIA0KZmJkZXYgZW11bGF0aW9uIHRvIG1ha2UgdXNlIG9m
IGRybV9jbGllbnQsIHdoaWNoIHNob3VsZCByZXNvdmUgYSBudW1iZXIgDQpvZiBwcm9ibGVt
cy4gSSBleHBlY3QgdG8gcG9zdCB0aGlzIGFmdGVyIHRoZSB2YXJpb3VzIHRyZWVzIGhhdmUg
bWVyZ2VkIA0KdGhlIHJlY2VudCBjaGFuZ2VzIHRvIGZiZGV2IGhlbHBlcnMuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2Fy
bWFkYS9hcm1hZGFfZmJkZXYuYyAgICAgIHwgMyArKysNCj4+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYyAgICAgICAgICAgIHwgMiAtLQ0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyAgICAgICAgfCAyICsrDQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jICB8IDMgKystDQo+PiAgIGRyaXZlcnMv
Z3B1L2RybS9nbWE1MDAvZnJhbWVidWZmZXIuYyAgICAgICB8IDIgKysNCj4+ICAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9mYmRldi5jIHwgMSArDQo+PiAgIGRyaXZl
cnMvZ3B1L2RybS9tc20vbXNtX2ZiZGV2LmMgICAgICAgICAgICB8IDIgKysNCj4+ICAgZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYmRldi5jICAgICAgIHwgMiArKw0KPj4gICBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mYi5jICAgICAgICAgfCAyICsrDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYi5jICAgICAgICAgICAgICAgICB8IDEgKw0KPj4g
ICAxMCBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0K
Pj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtYWRhL2FybWFkYV9mYmRl
di5jIGIvZHJpdmVycy9ncHUvZHJtL2FybWFkYS9hcm1hZGFfZmJkZXYuYw0KPj4gaW5kZXgg
MDdlNDEwYzYyYjdhLi4wZTQ0ZjUzZTlmYTQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYXJtYWRhL2FybWFkYV9mYmRldi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtYWRhL2FybWFkYV9mYmRldi5jDQo+PiBAQCAtMTQ3LDYgKzE0Nyw3IEBAIGludCBhcm1h
ZGFfZmJkZXZfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gICAgZXJyX2ZiX3Nl
dHVwOg0KPj4gICAJZHJtX2ZiX2hlbHBlcl9maW5pKGZiaCk7DQo+PiAgICBlcnJfZmJfaGVs
cGVyOg0KPj4gKwlkcm1fZmJfaGVscGVyX3VucHJlcGFyZShmYmgpOw0KPj4gICAJcHJpdi0+
ZmJkZXYgPSBOVUxMOw0KPj4gICAJcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4gQEAgLTE2NCw2
ICsxNjUsOCBAQCB2b2lkIGFybWFkYV9mYmRldl9maW5pKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpDQo+PiAgIAkJaWYgKGZiaC0+ZmIpDQo+PiAgIAkJCWZiaC0+ZmItPmZ1bmNzLT5kZXN0
cm95KGZiaC0+ZmIpOw0KPj4gICANCj4+ICsJCWRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKGZi
aCk7DQo+PiArDQo+PiAgIAkJcHJpdi0+ZmJkZXYgPSBOVUxMOw0KPj4gICAJfQ0KPj4gICB9
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+IGluZGV4IDI4YzQyOGU5YzUzMC4u
YTM5OTk4MDQ3ZjhhIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9o
ZWxwZXIuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4g
QEAgLTU5MCw4ICs1OTAsNiBAQCB2b2lkIGRybV9mYl9oZWxwZXJfZmluaShzdHJ1Y3QgZHJt
X2ZiX2hlbHBlciAqZmJfaGVscGVyKQ0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBnb29k
IHRvIHVwZGF0ZSB0aGUga2VybmVsZG9jIG9mIF9pbml0KCkgYW5kIF9maW5pKCkNCj4gaGVy
ZSB0byBtZW50aW9uIGVhY2ggYW5vdGhlciBsaWtlIHdlIHVzdWFsbHkgZG8gd2l0aCB0aGVz
ZSBwYWlycy4gU2FtZQ0KPiB3aXRoIHByZXBhcmUvdW5wcmVwYXJlKCkgYWx0aG91Z2ggdGhl
IGxhdHRlciByZXJmZW5jZXMgX3ByZXBhcmUoKSBhbHJlYWR5Lg0KPiANCj4+ICAgCX0NCj4+
ICAgCW11dGV4X3VubG9jaygma2VybmVsX2ZiX2hlbHBlcl9sb2NrKTsNCj4+ICAgDQo+PiAt
CWRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKGZiX2hlbHBlcik7DQo+PiAtDQo+PiAgIAlpZiAo
IWZiX2hlbHBlci0+Y2xpZW50LmZ1bmNzKQ0KPj4gICAJCWRybV9jbGllbnRfcmVsZWFzZSgm
ZmJfaGVscGVyLT5jbGllbnQpOw0KPj4gICB9DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2
X2dlbmVyaWMuYw0KPj4gaW5kZXggMzY1ZjgwNzE3ZmExLi40ZDYzMjVlOTE1NjUgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4+IEBAIC02NSw2ICs2
NSw4IEBAIHN0YXRpYyB2b2lkIGRybV9mYmRldl9mYl9kZXN0cm95KHN0cnVjdCBmYl9pbmZv
ICppbmZvKQ0KPj4gICANCj4+ICAgCWRybV9jbGllbnRfZnJhbWVidWZmZXJfZGVsZXRlKGZi
X2hlbHBlci0+YnVmZmVyKTsNCj4+ICAgCWRybV9jbGllbnRfcmVsZWFzZSgmZmJfaGVscGVy
LT5jbGllbnQpOw0KPj4gKw0KPj4gKwlkcm1fZmJfaGVscGVyX3VucHJlcGFyZShmYl9oZWxw
ZXIpOw0KPj4gICAJa2ZyZWUoZmJfaGVscGVyKTsNCj4+ICAgfQ0KPj4gICANCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jDQo+PiBpbmRleCBiODll
MzNhZjhkYTguLjQ5MjlmZmU1YTA5YSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYw0KPj4gQEAgLTE4Myw4ICsxODMsOCBAQCBpbnQg
ZXh5bm9zX2RybV9mYmRldl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgIA0K
Pj4gICBlcnJfc2V0dXA6DQo+PiAgIAlkcm1fZmJfaGVscGVyX2ZpbmkoaGVscGVyKTsNCj4+
IC0NCj4+ICAgZXJyX2luaXQ6DQo+PiArCWRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKGhlbHBl
cik7DQo+PiAgIAlwcml2YXRlLT5mYl9oZWxwZXIgPSBOVUxMOw0KPj4gICAJa2ZyZWUoZmJk
ZXYpOw0KPj4gICANCj4+IEBAIC0yMTksNiArMjE5LDcgQEAgdm9pZCBleHlub3NfZHJtX2Zi
ZGV2X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+ICAgCWZiZGV2ID0gdG9fZXh5
bm9zX2ZiZGV2KHByaXZhdGUtPmZiX2hlbHBlcik7DQo+PiAgIA0KPj4gICAJZXh5bm9zX2Ry
bV9mYmRldl9kZXN0cm95KGRldiwgcHJpdmF0ZS0+ZmJfaGVscGVyKTsNCj4+ICsJZHJtX2Zi
X2hlbHBlcl91bnByZXBhcmUocHJpdmF0ZS0+ZmJfaGVscGVyKTsNCj4+ICAgCWtmcmVlKGZi
ZGV2KTsNCj4+ICAgCXByaXZhdGUtPmZiX2hlbHBlciA9IE5VTEw7DQo+PiAgIH0NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1lYnVmZmVyLmMNCj4+IGluZGV4IDFmMDRjMDdlZTE4
MC4uZjQ3MWUwY2I3Mjk4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUw
MC9mcmFtZWJ1ZmZlci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2ZyYW1l
YnVmZmVyLmMNCj4+IEBAIC00MjcsNiArNDI3LDcgQEAgaW50IHBzYl9mYmRldl9pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgIGZpbmk6DQo+PiAgIAlkcm1fZmJfaGVscGVy
X2ZpbmkoZmJfaGVscGVyKTsNCj4+ICAgZnJlZToNCj4+ICsJZHJtX2ZiX2hlbHBlcl91bnBy
ZXBhcmUoZmJfaGVscGVyKTsNCj4+ICAgCWtmcmVlKGZiX2hlbHBlcik7DQo+PiAgIAlyZXR1
cm4gcmV0Ow0KPj4gICB9DQo+PiBAQCAtNDM5LDYgKzQ0MCw3IEBAIHN0YXRpYyB2b2lkIHBz
Yl9mYmRldl9maW5pKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgIAkJcmV0dXJuOw0K
Pj4gICANCj4+ICAgCXBzYl9mYmRldl9kZXN0cm95KGRldiwgZGV2X3ByaXYtPmZiX2hlbHBl
cik7DQo+PiArCWRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKGRldl9wcml2LT5mYl9oZWxwZXIp
Ow0KPj4gICAJa2ZyZWUoZGV2X3ByaXYtPmZiX2hlbHBlcik7DQo+PiAgIAlkZXZfcHJpdi0+
ZmJfaGVscGVyID0gTlVMTDsNCj4+ICAgfQ0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZmJkZXYuYw0KPj4gaW5kZXggNjExM2Q3NjI3ZDQ1Li45ODAyOTA1
OWY3MDEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2ZiZGV2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZmJkZXYuYw0KPj4gQEAgLTM1Miw2ICszNTIsNyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9m
YmRldl9kZXN0cm95KHN0cnVjdCBpbnRlbF9mYmRldiAqaWZiZGV2KQ0KPj4gICAJaWYgKGlm
YmRldi0+ZmIpDQo+PiAgIAkJZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZSgmaWZiZGV2LT5mYi0+
YmFzZSk7DQo+PiAgIA0KPj4gKwlkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgmaWZiZGV2LT5o
ZWxwZXIpOw0KPj4gICAJa2ZyZWUoaWZiZGV2KTsNCj4+ICAgfQ0KPj4gICANCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYmRldi5jIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZmJkZXYuYw0KPj4gaW5kZXggOTE1YjIxM2YzYTVjLi5jODA0ZTViYTY4
MmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYmRldi5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYmRldi5jDQo+PiBAQCAtMTcwLDYg
KzE3MCw3IEBAIHN0cnVjdCBkcm1fZmJfaGVscGVyICptc21fZmJkZXZfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQ0KPj4gICBmaW5pOg0KPj4gICAJZHJtX2ZiX2hlbHBlcl9maW5p
KGhlbHBlcik7DQo+PiAgIGZhaWw6DQo+PiArCWRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKGhl
bHBlcik7DQo+PiAgIAlrZnJlZShmYmRldik7DQo+PiAgIAlyZXR1cm4gTlVMTDsNCj4+ICAg
fQ0KPj4gQEAgLTE5Niw2ICsxOTcsNyBAQCB2b2lkIG1zbV9mYmRldl9mcmVlKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpDQo+PiAgIAkJZHJtX2ZyYW1lYnVmZmVyX3JlbW92ZShmYmRldi0+
ZmIpOw0KPj4gICAJfQ0KPj4gICANCj4+ICsJZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUoaGVs
cGVyKTsNCj4+ICAgCWtmcmVlKGZiZGV2KTsNCj4+ICAgDQo+PiAgIAlwcml2LT5mYmRldiA9
IE5VTEw7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9m
YmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYmRldi5jDQo+PiBpbmRl
eCBmYzVmNTJkNTY3YzYuLjg0NDI5NzI4MzQ3ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vb21hcF9mYmRldi5jDQo+PiBAQCAtMjU2LDYgKzI1Niw3IEBAIHZvaWQgb21h
cF9mYmRldl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+PiAgIGZpbmk6DQo+PiAg
IAlkcm1fZmJfaGVscGVyX2ZpbmkoaGVscGVyKTsNCj4+ICAgZmFpbDoNCj4+ICsJZHJtX2Zi
X2hlbHBlcl91bnByZXBhcmUoaGVscGVyKTsNCj4+ICAgCWtmcmVlKGZiZGV2KTsNCj4+ICAg
DQo+PiAgIAlkZXZfd2FybihkZXYtPmRldiwgIm9tYXBfZmJkZXZfaW5pdCBmYWlsZWRcbiIp
Ow0KPj4gQEAgLTI4Niw2ICsyODcsNyBAQCB2b2lkIG9tYXBfZmJkZXZfZmluaShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQ0KPj4gICAJaWYgKGZiZGV2LT5mYikNCj4+ICAgCQlkcm1fZnJh
bWVidWZmZXJfcmVtb3ZlKGZiZGV2LT5mYik7DQo+PiAgIA0KPj4gKwlkcm1fZmJfaGVscGVy
X3VucHJlcGFyZShoZWxwZXIpOw0KPj4gICAJa2ZyZWUoZmJkZXYpOw0KPj4gICANCj4+ICAg
CXByaXYtPmZiZGV2ID0gTlVMTDsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZmIu
Yw0KPj4gaW5kZXggNmU1ZWVkMGUxNTdjLi5jNDgwN2YwYzQzYmMgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mYi5jDQo+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mYi5jDQo+PiBAQCAtMzY3LDYgKzM2Nyw3IEBAIGlu
dCByYWRlb25fZmJkZXZfaW5pdChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldikNCj4+ICAg
ZmluaToNCj4+ICAgCWRybV9mYl9oZWxwZXJfZmluaSgmcmZiZGV2LT5oZWxwZXIpOw0KPj4g
ICBmcmVlOg0KPj4gKwlkcm1fZmJfaGVscGVyX3VucHJlcGFyZSgmcmZiZGV2LT5oZWxwZXIp
Ow0KPj4gICAJa2ZyZWUocmZiZGV2KTsNCj4+ICAgCXJldHVybiByZXQ7DQo+PiAgIH0NCj4+
IEBAIC0zNzcsNiArMzc4LDcgQEAgdm9pZCByYWRlb25fZmJkZXZfZmluaShzdHJ1Y3QgcmFk
ZW9uX2RldmljZSAqcmRldikNCj4+ICAgCQlyZXR1cm47DQo+PiAgIA0KPj4gICAJcmFkZW9u
X2ZiZGV2X2Rlc3Ryb3kocmRldi0+ZGRldiwgcmRldi0+bW9kZV9pbmZvLnJmYmRldik7DQo+
PiArCWRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKCZyZGV2LT5tb2RlX2luZm8ucmZiZGV2LT5o
ZWxwZXIpOw0KPj4gICAJa2ZyZWUocmRldi0+bW9kZV9pbmZvLnJmYmRldik7DQo+PiAgIAly
ZGV2LT5tb2RlX2luZm8ucmZiZGV2ID0gTlVMTDsNCj4+ICAgfQ0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Zi
LmMNCj4+IGluZGV4IDE1M2MzOWMzMmM3MS4uYmZlYmUyNzg2ZDYxIDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZiLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9mYi5jDQo+PiBAQCAtMzE1LDYgKzMxNSw3IEBAIHN0YXRpYyBzdHJ1Y3QgdGVn
cmFfZmJkZXYgKnRlZ3JhX2ZiZGV2X2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQ0K
Pj4gICANCj4+ICAgc3RhdGljIHZvaWQgdGVncmFfZmJkZXZfZnJlZShzdHJ1Y3QgdGVncmFf
ZmJkZXYgKmZiZGV2KQ0KPj4gICB7DQo+PiArCWRybV9mYl9oZWxwZXJfdW5wcmVwYXJlKCZm
YmRldi0+YmFzZSk7DQo+IA0KPiBPayB0aGlzIG9uZSB0ZWdyYSBjaGFuZ2Ugd2FzIGEgYml0
IHRyaWNreSwgZHJpdmVycyByZWFsbHkgc2hvdWxkIGp1c3QgdXNlDQo+IGRybW1fL2Rldm1f
IGZvciBldmVyeXRoaW5nIDotKQ0KPiANCj4gV2l0aCB0aGUga2VybmVsZG9jIGF1Z21lbnRl
ZDoNCj4gDQo+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPg0KPiANCj4+ICAgCWtmcmVlKGZiZGV2KTsNCj4+ICAgfQ0KPj4gICANCj4+IC0t
IA0KPj4gMi4zOS4xDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------M4H0F7TbJNxCTGnxSAcxT4xQ--

--------------PB0l0H7GsZYN00xVZ8W6EuRY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvOG4FAwAAAAAACgkQlh/E3EQov+AU
Ew//cPBpy7htvHETpgKImsD5EjANgrVrVfxin+UV63Iqhuho3ueqffLIZhCVyV3OgOOFllNwM52e
mYnNlZ7Fb5y5UzhtGn30yeKsB7rDC20AN+ksE7dE/UPpkF4UzLw53ulzBevF7DJXVx9X4dmx7nA1
slrGZp9Ri9hvuWNK8O3Hrp8pZjXVfZm20QJfcANsw9nl4vqLnSvPJ65xOR2eW9Lh54NneE5smAXj
HX75Be/aOfXkdDluT03HeyMFbJdOgOOvcWCHJT8YvTwUMWHexUBxskkNiAsLXZAxLuN5ifXZmjhX
karofl2M8k0B7qOdwcqCaKxTwbINA3eD8IiRyG/ilR0H1fodt81ZipBCzFUiNI+4eaDSiTP5gegY
qDvd56Z5dSd8FKQrVfOTN+SOgKEgHu8y4KVUcmPcNDWVjwn6dvkUmcUOY4JyLS5DO1GKi372Y/ap
eklEO6HDUqALE+e+u2dzQHXvngC6KpBZ7TnjHBinQ7UOylEyNA5hKsFca3n3UpbVzp+L8Id9onWK
zid2tPEwuNT/nZMGQ2HiIeRTLqzbRxJ8Iy1XiRfAWSYJ9VR5XYTlZbacC8++B/DsFvUolVCOstrE
pituSkNp+obK2ErB4gtohtwzz425nFeMWFOZlzJwUi++RJUbahtofb0iZDxyBJrOCGlbhqJgJ9GC
hVw=
=F1do
-----END PGP SIGNATURE-----

--------------PB0l0H7GsZYN00xVZ8W6EuRY--
