Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2691C712C
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 May 2020 14:59:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgEFM7U (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 6 May 2020 08:59:20 -0400
Received: from m176150.mail.qiye.163.com ([59.111.176.150]:28071 "EHLO
        m176150.mail.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728081AbgEFM7U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 May 2020 08:59:20 -0400
X-Greylist: delayed 583 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 May 2020 08:59:20 EDT
Received: from vivo.com (wm-10.qy.internal [127.0.0.1])
        by m176150.mail.qiye.163.com (Hmail) with ESMTP id 6E7471A31C1;
        Wed,  6 May 2020 20:49:03 +0800 (CST)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Message-ID: <AMkACAAICCLCcgaekrYcyKoA.1.1588769343436.Hmail.bernard@vivo.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vZXh5bm9zOiByZW1vdmUgbm8gbmVlZCBkZXZtX2tmcmVlIGluIHByb2JlIFtyZS1zZW5kLCB3ZWxjb21lIGFueSBjb21tZW50c10=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 157.0.31.122
MIME-Version: 1.0
Received: from bernard@vivo.com( [157.0.31.122) ] by ajax-webmail ( [127.0.0.1] ) ; Wed, 6 May 2020 20:49:03 +0800 (GMT+08:00)
From:   Bernard <bernard@vivo.com>
Date:   Wed, 6 May 2020 20:49:03 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VPQ0NCQkJDT0hOQkxPSllXWShZQU
        hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo2EDo4OjoyODg3OBgcGh4QCSIY
        AjAUOlVKVUpOQ0NMTUJIT0hOSkpVMxYaEhdVGR4JFRoJHzsNEg0UVRgUFkVZV1kSC1lBWUpOTFVL
        VUhKVUpJSVlXWQgBWUFITUlDNwY+
X-HM-Tid: 0a71ea0847e793b4kuws6e7471a31c1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

UmVtb3ZlIG5vIG5lZWQgZGV2bV9rZnJlZSBpbiBwcm9iZS4KVGhlIGNoYW5nZSBpcyB0byBtYWtl
IHRoZSBjb2RlIGEgYml0IG1vcmUgcmVhZGFibGUKClNpZ25lZC1vZmYtYnk6IEJlcm5hcmQgWmhh
byA8YmVybmFyZEB2aXZvLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZHBpLmMgfCAxMCArKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2RybV9kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9kcGkuYwpp
bmRleCA0M2ZhMGYyNmMwNTIuLmUwNmY3ZDdhNjY5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2V4eW5vcy9leHlub3NfZHJtX2RwaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9kcGkuYwpAQCAtMTgxLDEwICsxODEsOCBAQCBzdGF0aWMgaW50IGV4eW5vc19k
cGlfcGFyc2VfZHQoc3RydWN0IGV4eW5vc19kcGkgKmN0eCkKIAkJCXJldHVybiAtRU5PTUVNOwog
CiAJCXJldCA9IG9mX2dldF92aWRlb21vZGUoZG4sIHZtLCAwKTsKLQkJaWYgKHJldCA8IDApIHsK
LQkJCWRldm1fa2ZyZWUoZGV2LCB2bSk7CisJCWlmIChyZXQgPCAwKQogCQkJcmV0dXJuIHJldDsK
LQkJfQogCiAJCWN0eC0+dm0gPSB2bTsKIApAQCAtMjMzLDEwICsyMzEsOCBAQCBzdHJ1Y3QgZHJt
X2VuY29kZXIgKmV4eW5vc19kcGlfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQogCWN0eC0+ZGV2
ID0gZGV2OwogCiAJcmV0ID0gZXh5bm9zX2RwaV9wYXJzZV9kdChjdHgpOwotCWlmIChyZXQgPCAw
KSB7Ci0JCWRldm1fa2ZyZWUoZGV2LCBjdHgpOwotCQlyZXR1cm4gTlVMTDsKLQl9CisJaWYgKHJl
dCA8IDApCisJCXJldHVybiBFUlJfUFRSKHJldCk7CiAKIAlpZiAoY3R4LT5wYW5lbF9ub2RlKSB7
CiAJCWN0eC0+cGFuZWwgPSBvZl9kcm1fZmluZF9wYW5lbChjdHgtPnBhbmVsX25vZGUpOwotLSAK
Mi4yNi4yCgoKW3JlLXNlbmQsIHdlbGNvbWUgYW55IGNvbW1lbnRzXQpSZWdhcmRzLApCZXJuYXJk
CgoKDQoNCg==
