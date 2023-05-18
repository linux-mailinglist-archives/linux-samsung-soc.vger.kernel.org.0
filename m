Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C8F7082A9
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 18 May 2023 15:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbjERNaZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 18 May 2023 09:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230189AbjERNaY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 18 May 2023 09:30:24 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27F7FE;
        Thu, 18 May 2023 06:30:21 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 8F8F11F381;
        Thu, 18 May 2023 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1684416620; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RP9fAVMO6riPqMZ4iL2SJY3LXuSGDR5zYLR6oNzVvbg=;
        b=DRGtcfzksvTNzSaGlYlDBBxYV4swvGrlQFUt+CH57QjOJzfvbyoKBAAzIv52x8ALiPcjrg
        vtwvg6MmsFpKju8Pz/YiTGDjxh4g87sazojhr3vHQVepWJthy09Rjy2cx/NUPWMdyhnyp7
        u+1x71+A6YAJLs799F5i2c4tLkwRXik=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1684416620;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=RP9fAVMO6riPqMZ4iL2SJY3LXuSGDR5zYLR6oNzVvbg=;
        b=XEol8yFO83o+JezNRIrPWDZUUjJm+0Jjq3QkIWM4//HX9UxChomkpBBLi0vynJIHWmeDfO
        Amqv4aV4acEEtJDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E38A138F5;
        Thu, 18 May 2023 13:30:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id kVMnCmwoZmSLQgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 18 May 2023 13:30:20 +0000
Message-ID: <eea1a97f-b5cb-3021-147b-bfddfe6639d3@suse.de>
Date:   Thu, 18 May 2023 15:30:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [v2,11/12] drm/fbdev-generic: Implement dedicated fbdev I/O
 helpers
To:     Sui Jingfeng <15330273260@189.cn>, daniel@ffwll.ch,
        airlied@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, javierm@redhat.com, sam@ravnborg.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
References: <20230515094033.2133-12-tzimmermann@suse.de>
 <80b4b615-0a71-89e8-3a58-fbeb8a9a06e8@189.cn>
 <28d2e7d5-7dde-b1f9-3b5f-0ba51f8eaaeb@suse.de>
 <f1688b87-0b8d-59b0-2fe8-88b2d40c513e@189.cn>
Content-Language: en-US
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f1688b87-0b8d-59b0-2fe8-88b2d40c513e@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CaLkyQknB5zn9bn0fJaZ0BXD"
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CaLkyQknB5zn9bn0fJaZ0BXD
Content-Type: multipart/mixed; boundary="------------3aAtJKIBwKHeeZhpF6WFWUpG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>, daniel@ffwll.ch, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, javierm@redhat.com,
 sam@ravnborg.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <eea1a97f-b5cb-3021-147b-bfddfe6639d3@suse.de>
Subject: Re: [v2,11/12] drm/fbdev-generic: Implement dedicated fbdev I/O
 helpers
References: <20230515094033.2133-12-tzimmermann@suse.de>
 <80b4b615-0a71-89e8-3a58-fbeb8a9a06e8@189.cn>
 <28d2e7d5-7dde-b1f9-3b5f-0ba51f8eaaeb@suse.de>
 <f1688b87-0b8d-59b0-2fe8-88b2d40c513e@189.cn>
In-Reply-To: <f1688b87-0b8d-59b0-2fe8-88b2d40c513e@189.cn>

--------------3aAtJKIBwKHeeZhpF6WFWUpG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDUuMjMgdW0gMTQ6NDYgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gT24gMjAyMy81LzE3IDE1OjA3LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IEhpDQo+Pg0KPj4gQW0gMTcuMDUuMjMgdW0gMDM6NTggc2NocmllYiBTdWkgSmluZ2Zl
bmc6DQo+Pj4gSGksIFRob21hcw0KPj4+DQo+Pj4NCj4+PiBBZnRlciBhcHBseSB5b3VyIHBh
dGNoIHNldCwgdGhlIGtlcm5lbCB3aXRoIA0KPj4+IGFyY2gvbG9vbmdhcmNoL2NvbmZpZ3Mv
bG9vbmdzb24zX2RlZmNvbmZpZw0KPj4+DQo+Pj4gY2FuIG5vdCBmaW5pc2ggY29tcGlsZSBh
bnltb3JlLsKgIGdjYyBjb21wbGFpbnM6DQo+Pj4NCj4+Pg0KPj4+IMKgwqAgQVLCoMKgwqDC
oMKgIGRyaXZlcnMvZ3B1L2J1aWx0LWluLmENCj4+PiDCoMKgIEFSwqDCoMKgwqDCoCBkcml2
ZXJzL2J1aWx0LWluLmENCj4+PiDCoMKgIEFSwqDCoMKgwqDCoCBidWlsdC1pbi5hDQo+Pj4g
wqDCoCBBUsKgwqDCoMKgwqAgdm1saW51eC5hDQo+Pj4gwqDCoCBMRMKgwqDCoMKgwqAgdm1s
aW51eC5vDQo+Pj4gwqDCoCBPQkpDT1BZIG1vZHVsZXMuYnVpbHRpbi5tb2RpbmZvDQo+Pj4g
wqDCoCBHRU7CoMKgwqDCoCBtb2R1bGVzLmJ1aWx0aW4NCj4+PiDCoMKgIEdFTsKgwqDCoMKg
IC52bWxpbnV4Lm9ianMNCj4+PiDCoMKgIE1PRFBPU1QgTW9kdWxlLnN5bXZlcnMNCj4+PiBF
UlJPUjogbW9kcG9zdDogImZiX3N5c193cml0ZSIgW2RyaXZlcnMvZ3B1L2RybS9kcm1fa21z
X2hlbHBlci5rb10gDQo+Pj4gdW5kZWZpbmVkIQ0KPj4+IEVSUk9SOiBtb2Rwb3N0OiAic3lz
X2ltYWdlYmxpdCIgW2RyaXZlcnMvZ3B1L2RybS9kcm1fa21zX2hlbHBlci5rb10gDQo+Pj4g
dW5kZWZpbmVkIQ0KPj4+IEVSUk9SOiBtb2Rwb3N0OiAic3lzX2ZpbGxyZWN0IiBbZHJpdmVy
cy9ncHUvZHJtL2RybV9rbXNfaGVscGVyLmtvXSANCj4+PiB1bmRlZmluZWQhDQo+Pj4gRVJS
T1I6IG1vZHBvc3Q6ICJzeXNfY29weWFyZWEiIFtkcml2ZXJzL2dwdS9kcm0vZHJtX2ttc19o
ZWxwZXIua29dIA0KPj4+IHVuZGVmaW5lZCENCj4+PiBFUlJPUjogbW9kcG9zdDogImZiX3N5
c19yZWFkIiBbZHJpdmVycy9ncHUvZHJtL2RybV9rbXNfaGVscGVyLmtvXSANCj4+PiB1bmRl
ZmluZWQhDQo+Pj4gbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLm1vZHBvc3Q6MTM2
OiBNb2R1bGUuc3ltdmVyc10gRXJyb3IgMQ0KPj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTk3
ODogbW9kcG9zdF0gRXJyb3IgMg0KPj4NCj4+IFRoYW5rcyBmb3IgcmVwb3J0aW5nIHRoaXMg
cHJvYmxlbS4gSSBmb3VuZCB0aGF0IGl0J3MgY2F1c2VkIGJ5IGEgdHlwbyANCj4+IGluIHRo
ZSB2ZXJ5IGZpcnN0IHBhdGNoIDEvNywgd2hlcmUgdGhlc2UgaGVscGVycyBhcmUgbm90IHNl
bGVjdGVkIA0KPj4gY29ycmVjdGx5LiBXaWxsIGJlIGZpeGVkIGluIHRoZSBuZXh0IHJvdW5k
Lg0KPj4NCj4gWWVhaCwgdGhpcyBpcyBqdXN0IGEgdHlwby4NCj4gDQo+IFNob3VsZCByZXBs
YWNlICdGQl9TWVNfSEVMUEVSJyB3aXRoICdGQl9TWVNfSEVMUEVSUycgb24gdGhlIGZpcnN0
IHBhdGNoIA0KPiBvZiB0aGlzIHNlcmllcy4NCj4gDQo+IA0KPj4gQmVzdCByZWdhcmRzDQo+
PiBUaG9tYXMNCj4+DQo+Pj4NCj4+Pg0KPj4+IE9uIDIwMjMvNS8xNSAxNzo0MCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+IEltcGxlbWVudCBkZWRpY2F0ZWQgZmJkZXYgaGVs
cGVycyBmb3IgZnJhbWVidWZmZXIgSS9PIGluc3RlYWQNCj4+Pj4gb2YgdXNpbmcgRFJNJ3Mg
aGVscGVycy4gRmJkZXYtZ2VuZXJpYyB3YXMgdGhlIG9ubHkgY2FsbGVyIG9mIHRoZQ0KPj4+
PiBEUk0gaGVscGVycywgc28gcmVtb3ZlIHRoZW0gZnJvbSB0aGUgaGVscGVyIG1vZHVsZS4N
Cj4+Pj4NCj4+Pj4gdjI6DQo+Pj4+IMKgwqDCoMKgKiB1c2UgRkJfU1lTX0hFTFBFUlNfREVG
RVJSRUQgb3B0aW9uDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+PiAtLS0NCj4+Pj4gwqAgZHJpdmVycy9n
cHUvZHJtL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNiArLQ0KPj4+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jwqDCoMKgwqAgfCAxMDcgDQo+
Pj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gwqAgZHJpdmVycy9ncHUv
ZHJtL2RybV9mYmRldl9nZW5lcmljLmMgfMKgIDQ3ICsrKysrKysrKystLQ0KPj4+PiDCoCBp
bmNsdWRlL2RybS9kcm1fZmJfaGVscGVyLmjCoMKgwqDCoMKgwqDCoMKgIHzCoCA0MSAtLS0t
LS0tLS0tLQ0KPj4+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDE1
OCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4+Pj4gaW5kZXggNzdmYjEw
ZGRkOGEyLi45MmE3ODI4MjdiN2IgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9LY29uZmlnDQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+Pj4+IEBA
IC05NSw2ICs5NSw3IEBAIGNvbmZpZyBEUk1fS1VOSVRfVEVTVA0KPj4+PiDCoCBjb25maWcg
RFJNX0tNU19IRUxQRVINCj4+Pj4gwqDCoMKgwqDCoCB0cmlzdGF0ZQ0KPj4+PiDCoMKgwqDC
oMKgIGRlcGVuZHMgb24gRFJNDQo+Pj4+ICvCoMKgwqAgc2VsZWN0IEZCX1NZU19IRUxQRVJT
X0RFRkVSUkVEIGlmIERSTV9GQkRFVl9FTVVMQVRJT04NCj4+Pg0KPj4+IEhlcmUsIHNlbGVj
dCBGQl9TWVNfSEVMUEVSUyBoZWxwcyByZXNvbHZlIHRoZSBhYm92ZSBpc3N1ZSBtZW50aW9u
ZWQuDQo+Pj4NCj4gQnV0IHNlbGVjdCBGQl9TWVNfSEVMUEVSUyBoZXJlIGlzIG1vcmUgYmV0
dGVyLCBJIHRoaW5rLsKgIEJlY2F1c2UgaXQgc2hvdyANCj4gdGhlIG5hdHVyZSB0aGF0DQo+
IA0KPiBEUk1fS01TX0hFTFBFUiBpcyBkZXBlbmQgb24gRkJfU1lTX0hFTFBFUlMsIEkgdGhp
bmsgeW91IG1heSB3YW50IGlzb2xhdGUNCj4gDQo+IHRob3NlIGRlcGVuZGVuY3kgd2l0aCBE
Uk1fRkJERVZfRU1VTEFUSU9OIGd1YXJkLg0KPiANCj4gYXQgbGVhc3QsIHlvdSBzaG91bGQg
Z3VhcmFudGVlIHRoYXQgZHJtIGl0c2VsZiBjb3VsZCBidWlsdCBhbmQgcnVuIA0KPiBzdGFu
ZGFsb25lLg0KDQpJbmRlZWQsIGl0IHdvdWxkIGJlIGJldHRlciB0byBzZWxlY3QgdGhpcyBm
cm9tIERSTV9GQkRFVl9FTVVMQVRJT04uIA0KVGhhbmtzIGZvciB0aGUgcmVtYXJrLiBJJ2xs
IHVwZGF0ZSB0aGlzIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQo+IEZiZGV2IGVtdWxhdGlvbiBpcyBhIGNsaWVudCBvZiBkcm0sIG5vdCBy
ZXZlcnNlLg0KPiANCj4gDQo+IEJ5IHRoZSB3YXksIGRvZXMgRGVuaWFsIGhhcHB5IGFib3V0
IHRoaXMsDQo+IA0KPiBtYXliZSwgaGUgd2FudCB0aGUgZmJkZXYgZW11bGF0aW9uIDEwMCUg
bWFkZSBpbiBkcm0/DQo+IA0KPj4+PiDCoMKgwqDCoMKgIGhlbHANCj4+Pj4gwqDCoMKgwqDC
oMKgwqAgQ1JUQyBoZWxwZXJzIGZvciBLTVMgZHJpdmVycy4NCj4+Pj4gQEAgLTEzNSwxMSAr
MTM2LDYgQEAgY29uZmlnIERSTV9GQkRFVl9FTVVMQVRJT04NCj4+Pj4gwqDCoMKgwqDCoCBz
ZWxlY3QgRkJfQ0ZCX0ZJTExSRUNUDQo+Pj4+IMKgwqDCoMKgwqAgc2VsZWN0IEZCX0NGQl9D
T1BZQVJFQQ0KPj4+PiDCoMKgwqDCoMKgIHNlbGVjdCBGQl9DRkJfSU1BR0VCTElUDQo+Pj4+
IC3CoMKgwqAgc2VsZWN0IEZCX0RFRkVSUkVEX0lPDQo+Pj4+IC3CoMKgwqAgc2VsZWN0IEZC
X1NZU19GT1BTDQo+Pj4+IC3CoMKgwqAgc2VsZWN0IEZCX1NZU19GSUxMUkVDVA0KPj4+PiAt
wqDCoMKgIHNlbGVjdCBGQl9TWVNfQ09QWUFSRUENCj4+Pj4gLcKgwqDCoCBzZWxlY3QgRkJf
U1lTX0lNQUdFQkxJVA0KPj4+PiDCoMKgwqDCoMKgIHNlbGVjdCBGUkFNRUJVRkZFUl9DT05T
T0xFIGlmICFFWFBFUlQNCj4+Pj4gwqDCoMKgwqDCoCBzZWxlY3QgRlJBTUVCVUZGRVJfQ09O
U09MRV9ERVRFQ1RfUFJJTUFSWSBpZiBGUkFNRUJVRkZFUl9DT05TT0xFDQo+Pj4+IMKgwqDC
oMKgwqAgZGVmYXVsdCB5DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jIA0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMN
Cj4+Pj4gaW5kZXggODcyNGUwOGM1MThiLi5iYTBhODA4ZjE0ZWUgMTAwNjQ0DQo+Pj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4+PiBAQCAtNzI5LDExMyArNzI5LDYgQEAg
dm9pZCBkcm1fZmJfaGVscGVyX2RlZmVycmVkX2lvKHN0cnVjdCBmYl9pbmZvIA0KPj4+PiAq
aW5mbywgc3RydWN0IGxpc3RfaGVhZCAqcGFnZXJlZmxpDQo+Pj4+IMKgIH0NCj4+Pj4gwqAg
RVhQT1JUX1NZTUJPTChkcm1fZmJfaGVscGVyX2RlZmVycmVkX2lvKTsNCj4+Pj4gLS8qKg0K
Pj4+PiAtICogZHJtX2ZiX2hlbHBlcl9zeXNfcmVhZCAtIEltcGxlbWVudHMgc3RydWN0ICZm
Yl9vcHMuZmJfcmVhZCBmb3IgDQo+Pj4+IHN5c3RlbSBtZW1vcnkNCj4+Pj4gLSAqIEBpbmZv
OiBmYl9pbmZvIHN0cnVjdCBwb2ludGVyDQo+Pj4+IC0gKiBAYnVmOiB1c2Vyc3BhY2UgYnVm
ZmVyIHRvIHJlYWQgZnJvbSBmcmFtZWJ1ZmZlciBtZW1vcnkNCj4+Pj4gLSAqIEBjb3VudDog
bnVtYmVyIG9mIGJ5dGVzIHRvIHJlYWQgZnJvbSBmcmFtZWJ1ZmZlciBtZW1vcnkNCj4+Pj4g
LSAqIEBwcG9zOiByZWFkIG9mZnNldCB3aXRoaW4gZnJhbWVidWZmZXIgbWVtb3J5DQo+Pj4+
IC0gKg0KPj4+PiAtICogUmV0dXJuczoNCj4+Pj4gLSAqIFRoZSBudW1iZXIgb2YgYnl0ZXMg
cmVhZCBvbiBzdWNjZXNzLCBvciBhbiBlcnJvciBjb2RlIG90aGVyd2lzZS4NCj4+Pj4gLSAq
Lw0KPj4+PiAtc3NpemVfdCBkcm1fZmJfaGVscGVyX3N5c19yZWFkKHN0cnVjdCBmYl9pbmZv
ICppbmZvLCBjaGFyIF9fdXNlciAqYnVmLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKQ0KPj4+PiAtew0K
Pj4+PiAtwqDCoMKgIHJldHVybiBmYl9zeXNfcmVhZChpbmZvLCBidWYsIGNvdW50LCBwcG9z
KTsNCj4+Pj4gLX0NCj4+Pj4gLUVYUE9SVF9TWU1CT0woZHJtX2ZiX2hlbHBlcl9zeXNfcmVh
ZCk7DQo+Pj4+IC0NCj4+Pj4gLS8qKg0KPj4+PiAtICogZHJtX2ZiX2hlbHBlcl9zeXNfd3Jp
dGUgLSBJbXBsZW1lbnRzIHN0cnVjdCAmZmJfb3BzLmZiX3dyaXRlIGZvciANCj4+Pj4gc3lz
dGVtIG1lbW9yeQ0KPj4+PiAtICogQGluZm86IGZiX2luZm8gc3RydWN0IHBvaW50ZXINCj4+
Pj4gLSAqIEBidWY6IHVzZXJzcGFjZSBidWZmZXIgdG8gd3JpdGUgdG8gZnJhbWVidWZmZXIg
bWVtb3J5DQo+Pj4+IC0gKiBAY291bnQ6IG51bWJlciBvZiBieXRlcyB0byB3cml0ZSB0byBm
cmFtZWJ1ZmZlciBtZW1vcnkNCj4+Pj4gLSAqIEBwcG9zOiB3cml0ZSBvZmZzZXQgd2l0aGlu
IGZyYW1lYnVmZmVyIG1lbW9yeQ0KPj4+PiAtICoNCj4+Pj4gLSAqIFJldHVybnM6DQo+Pj4+
IC0gKiBUaGUgbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4gb24gc3VjY2Vzcywgb3IgYW4gZXJy
b3IgY29kZSBvdGhlcndpc2UuDQo+Pj4+IC0gKi8NCj4+Pj4gLXNzaXplX3QgZHJtX2ZiX2hl
bHBlcl9zeXNfd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sIGNvbnN0IGNoYXIgDQo+Pj4+
IF9fdXNlciAqYnVmLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNp
emVfdCBjb3VudCwgbG9mZl90ICpwcG9zKQ0KPj4+PiAtew0KPj4+PiAtwqDCoMKgIHN0cnVj
dCBkcm1fZmJfaGVscGVyICpoZWxwZXIgPSBpbmZvLT5wYXI7DQo+Pj4+IC3CoMKgwqAgbG9m
Zl90IHBvcyA9ICpwcG9zOw0KPj4+PiAtwqDCoMKgIHNzaXplX3QgcmV0Ow0KPj4+PiAtwqDC
oMKgIHN0cnVjdCBkcm1fcmVjdCBkYW1hZ2VfYXJlYTsNCj4+Pj4gLQ0KPj4+PiAtwqDCoMKg
IHJldCA9IGZiX3N5c193cml0ZShpbmZvLCBidWYsIGNvdW50LCBwcG9zKTsNCj4+Pj4gLcKg
wqDCoCBpZiAocmV0IDw9IDApDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0K
Pj4+PiAtDQo+Pj4+IC3CoMKgwqAgaWYgKGhlbHBlci0+ZnVuY3MtPmZiX2RpcnR5KSB7DQo+
Pj4+IC3CoMKgwqDCoMKgwqDCoCBkcm1fZmJfaGVscGVyX21lbW9yeV9yYW5nZV90b19jbGlw
KGluZm8sIHBvcywgcmV0LCANCj4+Pj4gJmRhbWFnZV9hcmVhKTsNCj4+Pj4gLcKgwqDCoMKg
wqDCoMKgIGRybV9mYl9oZWxwZXJfZGFtYWdlKGhlbHBlciwgZGFtYWdlX2FyZWEueDEsIGRh
bWFnZV9hcmVhLnkxLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkcm1fcmVjdF93aWR0aCgmZGFtYWdlX2FyZWEpLA0KPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fcmVjdF9oZWlnaHQoJmRhbWFn
ZV9hcmVhKSk7DQo+Pj4+IC3CoMKgwqAgfQ0KPj4+PiAtDQo+Pj4+IC3CoMKgwqAgcmV0dXJu
IHJldDsNCj4+Pj4gLX0NCj4+Pj4gLUVYUE9SVF9TWU1CT0woZHJtX2ZiX2hlbHBlcl9zeXNf
d3JpdGUpOw0KPj4+PiAtDQo+Pj4+IC0vKioNCj4+Pj4gLSAqIGRybV9mYl9oZWxwZXJfc3lz
X2ZpbGxyZWN0IC0gd3JhcHBlciBhcm91bmQgc3lzX2ZpbGxyZWN0DQo+Pj4+IC0gKiBAaW5m
bzogZmJkZXYgcmVnaXN0ZXJlZCBieSB0aGUgaGVscGVyDQo+Pj4+IC0gKiBAcmVjdDogaW5m
byBhYm91dCByZWN0YW5nbGUgdG8gZmlsbA0KPj4+PiAtICoNCj4+Pj4gLSAqIEEgd3JhcHBl
ciBhcm91bmQgc3lzX2ZpbGxyZWN0IGltcGxlbWVudGVkIGJ5IGZiZGV2IGNvcmUNCj4+Pj4g
LSAqLw0KPj4+PiAtdm9pZCBkcm1fZmJfaGVscGVyX3N5c19maWxscmVjdChzdHJ1Y3QgZmJf
aW5mbyAqaW5mbywNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25z
dCBzdHJ1Y3QgZmJfZmlsbHJlY3QgKnJlY3QpDQo+Pj4+IC17DQo+Pj4+IC3CoMKgwqAgc3Ry
dWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciA9IGluZm8tPnBhcjsNCj4+Pj4gLQ0KPj4+PiAt
wqDCoMKgIHN5c19maWxscmVjdChpbmZvLCByZWN0KTsNCj4+Pj4gLQ0KPj4+PiAtwqDCoMKg
IGlmIChoZWxwZXItPmZ1bmNzLT5mYl9kaXJ0eSkNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGRy
bV9mYl9oZWxwZXJfZGFtYWdlKGhlbHBlciwgcmVjdC0+ZHgsIHJlY3QtPmR5LCANCj4+Pj4g
cmVjdC0+d2lkdGgsIHJlY3QtPmhlaWdodCk7DQo+Pj4+IC19DQo+Pj4+IC1FWFBPUlRfU1lN
Qk9MKGRybV9mYl9oZWxwZXJfc3lzX2ZpbGxyZWN0KTsNCj4+Pj4gLQ0KPj4+PiAtLyoqDQo+
Pj4+IC0gKiBkcm1fZmJfaGVscGVyX3N5c19jb3B5YXJlYSAtIHdyYXBwZXIgYXJvdW5kIHN5
c19jb3B5YXJlYQ0KPj4+PiAtICogQGluZm86IGZiZGV2IHJlZ2lzdGVyZWQgYnkgdGhlIGhl
bHBlcg0KPj4+PiAtICogQGFyZWE6IGluZm8gYWJvdXQgYXJlYSB0byBjb3B5DQo+Pj4+IC0g
Kg0KPj4+PiAtICogQSB3cmFwcGVyIGFyb3VuZCBzeXNfY29weWFyZWEgaW1wbGVtZW50ZWQg
YnkgZmJkZXYgY29yZQ0KPj4+PiAtICovDQo+Pj4+IC12b2lkIGRybV9mYl9oZWxwZXJfc3lz
X2NvcHlhcmVhKHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBmYl9jb3B5YXJlYSAqYXJlYSkNCj4+Pj4g
LXsNCj4+Pj4gLcKgwqDCoCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyID0gaW5mby0+
cGFyOw0KPj4+PiAtDQo+Pj4+IC3CoMKgwqAgc3lzX2NvcHlhcmVhKGluZm8sIGFyZWEpOw0K
Pj4+PiAtDQo+Pj4+IC3CoMKgwqAgaWYgKGhlbHBlci0+ZnVuY3MtPmZiX2RpcnR5KQ0KPj4+
PiAtwqDCoMKgwqDCoMKgwqAgZHJtX2ZiX2hlbHBlcl9kYW1hZ2UoaGVscGVyLCBhcmVhLT5k
eCwgYXJlYS0+ZHksIA0KPj4+PiBhcmVhLT53aWR0aCwgYXJlYS0+aGVpZ2h0KTsNCj4+Pj4g
LX0NCj4+Pj4gLUVYUE9SVF9TWU1CT0woZHJtX2ZiX2hlbHBlcl9zeXNfY29weWFyZWEpOw0K
Pj4+PiAtDQo+Pj4+IC0vKioNCj4+Pj4gLSAqIGRybV9mYl9oZWxwZXJfc3lzX2ltYWdlYmxp
dCAtIHdyYXBwZXIgYXJvdW5kIHN5c19pbWFnZWJsaXQNCj4+Pj4gLSAqIEBpbmZvOiBmYmRl
diByZWdpc3RlcmVkIGJ5IHRoZSBoZWxwZXINCj4+Pj4gLSAqIEBpbWFnZTogaW5mbyBhYm91
dCBpbWFnZSB0byBibGl0DQo+Pj4+IC0gKg0KPj4+PiAtICogQSB3cmFwcGVyIGFyb3VuZCBz
eXNfaW1hZ2VibGl0IGltcGxlbWVudGVkIGJ5IGZiZGV2IGNvcmUNCj4+Pj4gLSAqLw0KPj4+
PiAtdm9pZCBkcm1fZmJfaGVscGVyX3N5c19pbWFnZWJsaXQoc3RydWN0IGZiX2luZm8gKmlu
Zm8sDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1
Y3QgZmJfaW1hZ2UgKmltYWdlKQ0KPj4+PiAtew0KPj4+PiAtwqDCoMKgIHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpoZWxwZXIgPSBpbmZvLT5wYXI7DQo+Pj4+IC0NCj4+Pj4gLcKgwqDCoCBz
eXNfaW1hZ2VibGl0KGluZm8sIGltYWdlKTsNCj4+Pj4gLQ0KPj4+PiAtwqDCoMKgIGlmICho
ZWxwZXItPmZ1bmNzLT5mYl9kaXJ0eSkNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGRybV9mYl9o
ZWxwZXJfZGFtYWdlKGhlbHBlciwgaW1hZ2UtPmR4LCBpbWFnZS0+ZHksIA0KPj4+PiBpbWFn
ZS0+d2lkdGgsIGltYWdlLT5oZWlnaHQpOw0KPj4+PiAtfQ0KPj4+PiAtRVhQT1JUX1NZTUJP
TChkcm1fZmJfaGVscGVyX3N5c19pbWFnZWJsaXQpOw0KPj4+PiAtDQo+Pj4+IMKgIC8qKg0K
Pj4+PiDCoMKgICogZHJtX2ZiX2hlbHBlcl9jZmJfcmVhZCAtIEltcGxlbWVudHMgc3RydWN0
ICZmYl9vcHMuZmJfcmVhZCBmb3IgDQo+Pj4+IEkvTyBtZW1vcnkNCj4+Pj4gwqDCoCAqIEBp
bmZvOiBmYl9pbmZvIHN0cnVjdCBwb2ludGVyDQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyANCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4+PiBpbmRleCA4ZTUxNDhiZjQwYmIuLmY1M2ZjNDll
MzRhNCAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5l
cmljLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMN
Cj4+Pj4gQEAgLTM0LDYgKzM0LDQzIEBAIHN0YXRpYyBpbnQgZHJtX2ZiZGV2X2dlbmVyaWNf
ZmJfcmVsZWFzZShzdHJ1Y3QgDQo+Pj4+IGZiX2luZm8gKmluZm8sIGludCB1c2VyKQ0KPj4+
PiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+PiDCoCB9DQo+Pj4+ICtzdGF0aWMgc3NpemVf
dCBkcm1fZmJkZXZfZ2VuZXJpY19mYl93cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgDQo+
Pj4+IGNvbnN0IGNoYXIgX191c2VyICpidWYsDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+
Pj4+ICt7DQo+Pj4+ICvCoMKgwqAgc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciA9IGlu
Zm8tPnBhcjsNCj4+Pj4gK8KgwqDCoCBsb2ZmX3QgcG9zID0gKnBwb3M7DQo+Pj4+ICvCoMKg
wqAgc3NpemVfdCByZXQ7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCByZXQgPSBmYl9zeXNfd3Jp
dGUoaW5mbywgYnVmLCBjb3VudCwgcHBvcyk7DQo+Pj4+ICvCoMKgwqAgaWYgKHJldCA+IDAp
DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkcm1fZmJfaGVscGVyX2RhbWFnZV9yYW5nZShoZWxw
ZXIsIHBvcywgcmV0KTsNCj4+Pj4gK8KgwqDCoCByZXR1cm4gcmV0Ow0KPj4+PiArfQ0KPj4+
PiArDQo+Pj4+ICtzdGF0aWMgdm9pZCBkcm1fZmJkZXZfZ2VuZXJpY19mYl9maWxscmVjdChz
dHJ1Y3QgZmJfaW5mbyAqaW5mbywgDQo+Pj4+IGNvbnN0IHN0cnVjdCBmYl9maWxscmVjdCAq
cmVjdCkNCj4+Pj4gK3sNCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVs
cGVyID0gaW5mby0+cGFyOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgc3lzX2ZpbGxyZWN0KGlu
Zm8sIHJlY3QpOw0KPj4+PiArwqDCoMKgIGRybV9mYl9oZWxwZXJfZGFtYWdlKGhlbHBlciwg
cmVjdC0+ZHgsIHJlY3QtPmR5LCByZWN0LT53aWR0aCwgDQo+Pj4+IHJlY3QtPmhlaWdodCk7
DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4gK3N0YXRpYyB2b2lkIGRybV9mYmRldl9nZW5lcmlj
X2ZiX2NvcHlhcmVhKHN0cnVjdCBmYl9pbmZvICppbmZvLCANCj4+Pj4gY29uc3Qgc3RydWN0
IGZiX2NvcHlhcmVhICphcmVhKQ0KPj4+PiArew0KPj4+PiArwqDCoMKgIHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpoZWxwZXIgPSBpbmZvLT5wYXI7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCBz
eXNfY29weWFyZWEoaW5mbywgYXJlYSk7DQo+Pj4+ICvCoMKgwqAgZHJtX2ZiX2hlbHBlcl9k
YW1hZ2UoaGVscGVyLCBhcmVhLT5keCwgYXJlYS0+ZHksIGFyZWEtPndpZHRoLCANCj4+Pj4g
YXJlYS0+aGVpZ2h0KTsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArc3RhdGljIHZvaWQgZHJt
X2ZiZGV2X2dlbmVyaWNfZmJfaW1hZ2VibGl0KHN0cnVjdCBmYl9pbmZvICppbmZvLCANCj4+
Pj4gY29uc3Qgc3RydWN0IGZiX2ltYWdlICppbWFnZSkNCj4+Pj4gK3sNCj4+Pj4gK8KgwqDC
oCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyID0gaW5mby0+cGFyOw0KPj4+PiArDQo+
Pj4+ICvCoMKgwqAgc3lzX2ltYWdlYmxpdChpbmZvLCBpbWFnZSk7DQo+Pj4+ICvCoMKgwqAg
ZHJtX2ZiX2hlbHBlcl9kYW1hZ2UoaGVscGVyLCBpbWFnZS0+ZHgsIGltYWdlLT5keSwgDQo+
Pj4+IGltYWdlLT53aWR0aCwgaW1hZ2UtPmhlaWdodCk7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+
Pj4gwqAgc3RhdGljIHZvaWQgZHJtX2ZiZGV2X2dlbmVyaWNfZmJfZGVzdHJveShzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbykNCj4+Pj4gwqAgew0KPj4+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1f
ZmJfaGVscGVyICpmYl9oZWxwZXIgPSBpbmZvLT5wYXI7DQo+Pj4+IEBAIC01NiwxMiArOTMs
MTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmYl9vcHMgDQo+Pj4+IGRybV9mYmRldl9nZW5l
cmljX2ZiX29wcyA9IHsNCj4+Pj4gwqDCoMKgwqDCoCAub3duZXLCoMKgwqDCoMKgwqDCoCA9
IFRISVNfTU9EVUxFLA0KPj4+PiDCoMKgwqDCoMKgIC5mYl9vcGVuwqDCoMKgID0gZHJtX2Zi
ZGV2X2dlbmVyaWNfZmJfb3BlbiwNCj4+Pj4gwqDCoMKgwqDCoCAuZmJfcmVsZWFzZcKgwqDC
oCA9IGRybV9mYmRldl9nZW5lcmljX2ZiX3JlbGVhc2UsDQo+Pj4+IC3CoMKgwqAgLmZiX3Jl
YWTCoMKgwqAgPSBkcm1fZmJfaGVscGVyX3N5c19yZWFkLA0KPj4+PiAtwqDCoMKgIC5mYl93
cml0ZcKgwqDCoCA9IGRybV9mYl9oZWxwZXJfc3lzX3dyaXRlLA0KPj4+PiArwqDCoMKgIC5m
Yl9yZWFkwqDCoMKgID0gZmJfc3lzX3JlYWQsDQo+Pj4+ICvCoMKgwqAgLmZiX3dyaXRlwqDC
oMKgID0gZHJtX2ZiZGV2X2dlbmVyaWNfZmJfd3JpdGUsDQo+Pj4+IMKgwqDCoMKgwqAgRFJN
X0ZCX0hFTFBFUl9ERUZBVUxUX09QUywNCj4+Pj4gLcKgwqDCoCAuZmJfZmlsbHJlY3TCoMKg
wqAgPSBkcm1fZmJfaGVscGVyX3N5c19maWxscmVjdCwNCj4+Pj4gLcKgwqDCoCAuZmJfY29w
eWFyZWHCoMKgwqAgPSBkcm1fZmJfaGVscGVyX3N5c19jb3B5YXJlYSwNCj4+Pj4gLcKgwqDC
oCAuZmJfaW1hZ2VibGl0wqDCoMKgID0gZHJtX2ZiX2hlbHBlcl9zeXNfaW1hZ2VibGl0LA0K
Pj4+PiArwqDCoMKgIC5mYl9maWxscmVjdMKgwqDCoCA9IGRybV9mYmRldl9nZW5lcmljX2Zi
X2ZpbGxyZWN0LA0KPj4+PiArwqDCoMKgIC5mYl9jb3B5YXJlYcKgwqDCoCA9IGRybV9mYmRl
dl9nZW5lcmljX2ZiX2NvcHlhcmVhLA0KPj4+PiArwqDCoMKgIC5mYl9pbWFnZWJsaXTCoMKg
wqAgPSBkcm1fZmJkZXZfZ2VuZXJpY19mYl9pbWFnZWJsaXQsDQo+Pj4+IMKgwqDCoMKgwqAg
LmZiX21tYXDCoMKgwqAgPSBmYl9kZWZlcnJlZF9pb19tbWFwLA0KPj4+PiDCoMKgwqDCoMKg
IC5mYl9kZXN0cm95wqDCoMKgID0gZHJtX2ZiZGV2X2dlbmVyaWNfZmJfZGVzdHJveSwNCj4+
Pj4gwqAgfTsNCj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIu
aCBiL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaA0KPj4+PiBpbmRleCA4MGM0MDJmNGUz
NzkuLmUzMjQwZDc0OWE0MyAxMDA2NDQNCj4+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2Zi
X2hlbHBlci5oDQo+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mYl9oZWxwZXIuaA0KPj4+
PiBAQCAtMjU5LDE4ICsyNTksNiBAQCB2b2lkIGRybV9mYl9oZWxwZXJfZGFtYWdlX3Jhbmdl
KHN0cnVjdCANCj4+Pj4gZHJtX2ZiX2hlbHBlciAqaGVscGVyLCBvZmZfdCBvZmYsIHNpemVf
dA0KPj4+PiDCoCB2b2lkIGRybV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8oc3RydWN0IGZiX2lu
Zm8gKmluZm8sIHN0cnVjdCANCj4+Pj4gbGlzdF9oZWFkICpwYWdlcmVmbGlzdCk7DQo+Pj4+
IC1zc2l6ZV90IGRybV9mYl9oZWxwZXJfc3lzX3JlYWQoc3RydWN0IGZiX2luZm8gKmluZm8s
IGNoYXIgX191c2VyICpidWYsDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpOw0KPj4+PiAtc3NpemVfdCBk
cm1fZmJfaGVscGVyX3N5c193cml0ZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY29uc3QgY2hh
ciANCj4+Pj4gX191c2VyICpidWYsDQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpOw0KPj4+PiAtDQo+Pj4+IC12b2lk
IGRybV9mYl9oZWxwZXJfc3lzX2ZpbGxyZWN0KHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBmYl9maWxs
cmVjdCAqcmVjdCk7DQo+Pj4+IC12b2lkIGRybV9mYl9oZWxwZXJfc3lzX2NvcHlhcmVhKHN0
cnVjdCBmYl9pbmZvICppbmZvLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnN0IHN0cnVjdCBmYl9jb3B5YXJlYSAqYXJlYSk7DQo+Pj4+IC12b2lkIGRybV9m
Yl9oZWxwZXJfc3lzX2ltYWdlYmxpdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywNCj4+Pj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBmYl9pbWFnZSAq
aW1hZ2UpOw0KPj4+PiAtDQo+Pj4+IMKgIHNzaXplX3QgZHJtX2ZiX2hlbHBlcl9jZmJfcmVh
ZChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgY2hhciBfX3VzZXIgDQo+Pj4+ICpidWYsDQo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZV90IGNvdW50
LCBsb2ZmX3QgKnBwb3MpOw0KPj4+PiDCoCBzc2l6ZV90IGRybV9mYl9oZWxwZXJfY2ZiX3dy
aXRlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBjb25zdCBjaGFyIA0KPj4+PiBfX3VzZXIgKmJ1
ZiwNCj4+Pj4gQEAgLTM5OCwzNSArMzg2LDYgQEAgc3RhdGljIGlubGluZSBpbnQgDQo+Pj4+
IGRybV9mYl9oZWxwZXJfZGVmaW9faW5pdChzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVs
cGVyKQ0KPj4+PiDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOw0KPj4+PiDCoCB9DQo+Pj4+
IC1zdGF0aWMgaW5saW5lIHNzaXplX3QgZHJtX2ZiX2hlbHBlcl9zeXNfcmVhZChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbywNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBjaGFyIF9fdXNlciAqYnVmLCBzaXplX3QgY291bnQsDQo+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9m
Zl90ICpwcG9zKQ0KPj4+PiAtew0KPj4+PiAtwqDCoMKgIHJldHVybiAtRU5PREVWOw0KPj4+
PiAtfQ0KPj4+PiAtDQo+Pj4+IC1zdGF0aWMgaW5saW5lIHNzaXplX3QgZHJtX2ZiX2hlbHBl
cl9zeXNfd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sDQo+Pj4+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyIF9fdXNl
ciAqYnVmLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+Pj4+IC17DQo+Pj4+
IC3CoMKgwqAgcmV0dXJuIC1FTk9ERVY7DQo+Pj4+IC19DQo+Pj4+IC0NCj4+Pj4gLXN0YXRp
YyBpbmxpbmUgdm9pZCBkcm1fZmJfaGVscGVyX3N5c19maWxscmVjdChzdHJ1Y3QgZmJfaW5m
byAqaW5mbywNCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBmYl9maWxscmVjdCAqcmVjdCkNCj4+Pj4gLXsN
Cj4+Pj4gLX0NCj4+Pj4gLQ0KPj4+PiAtc3RhdGljIGlubGluZSB2b2lkIGRybV9mYl9oZWxw
ZXJfc3lzX2NvcHlhcmVhKHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0
IGZiX2NvcHlhcmVhICphcmVhKQ0KPj4+PiAtew0KPj4+PiAtfQ0KPj4+PiAtDQo+Pj4+IC1z
dGF0aWMgaW5saW5lIHZvaWQgZHJtX2ZiX2hlbHBlcl9zeXNfaW1hZ2VibGl0KHN0cnVjdCBm
Yl9pbmZvICppbmZvLA0KPj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgZmJfaW1hZ2UgKmltYWdlKQ0KPj4+
PiAtew0KPj4+PiAtfQ0KPj4+PiAtDQo+Pj4+IMKgIHN0YXRpYyBpbmxpbmUgc3NpemVfdCBk
cm1fZmJfaGVscGVyX2NmYl9yZWFkKHN0cnVjdCBmYl9pbmZvICppbmZvLCANCj4+Pj4gY2hh
ciBfX3VzZXIgKmJ1ZiwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplX3QgY291bnQsIGxvZmZfdCAqcHBvcykNCj4+Pj4g
wqAgew0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------3aAtJKIBwKHeeZhpF6WFWUpG--

--------------CaLkyQknB5zn9bn0fJaZ0BXD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRmKGsFAwAAAAAACgkQlh/E3EQov+Dd
pw//by3J2lv5ndgY50YBZrQKKn2x3IB9fJzz4hhFqStCGfNMiBh75LBS/T6XPv6z2yPkmfvQirGp
rp6l+JLJshGKGbozl7j1ABuRm+hL5v8AenBkDBf50cXZ6HaYW4n6p7gg9cT8isQbOlgK0jeakRno
/KW+NATIZ5QYs+jddDvCwjEtMZ/8FJcM+uYsIqjPu+C/yHQt/74fs5SPH8DuxHekGRNopeN1oe0B
5n1bHLbItxG4qBZAEhQeN9PQ1QRxqJF8Ugv20V2VIhYX2A91yIkG08u4QQrqV7XVRjMzn4jTl+DG
BTs25Exmhl2SyCXEXEl3d3h6zPCUheg7lUDH+c87+JD07v/xVcRBD98+roOhAK+a4A9GYr2qlgj2
mDmccW6y47XVcV24+GDGwrnsdqWAYJJ1kZMvRNSZw1uWU1niO72fsdBs/PZ9bTOKJCeM/q1d6e8N
B3EgB3U+qlmL/gnNS8jCgY69D6OhmF85oVap0PAlqcIKPy7ZskNotf2CMX9pi2/q41/sWwOQv+q0
TNCBw8EeaMxTIN9Tc9wfd/lhHR4F9F99x0jlFustXNOSK/Z8kRCKMamfxprH5+twrLD43P0u94/P
xFaafHOpeblO+P7qnt0Bco7m3xkG2I0fteqXHDzRKWQgz961Xo9qBQcht3fwV2aLOhr3Ic8iwMf6
kuc=
=4Ktu
-----END PGP SIGNATURE-----

--------------CaLkyQknB5zn9bn0fJaZ0BXD--
