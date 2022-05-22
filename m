Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2D45303C9
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 22 May 2022 17:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346899AbiEVPTY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 22 May 2022 11:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiEVPTX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 22 May 2022 11:19:23 -0400
X-Greylist: delayed 141 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 22 May 2022 08:19:18 PDT
Received: from jari.cn (unknown [218.92.28.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2BEF813F09
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 May 2022 08:19:17 -0700 (PDT)
Received: by ajax-webmail-localhost.localdomain (Coremail) ; Sun, 22 May
 2022 23:11:34 +0800 (GMT+08:00)
X-Originating-IP: [182.148.12.156]
Date:   Sun, 22 May 2022 23:11:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?6ZmI5a2m5YW1?= <chenxuebing@jari.cn>
To:     krzk@kernel.org
Cc:     alim.akhtar@samsung.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] ARM: s3c: Use strscpy to replace strlcpy
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.1 build 20210329(c53f3fee)
 Copyright (c) 2002-2022 www.mailtech.cn
 mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1f4faebf.9e6.180ec52dc40.Coremail.chenxuebing@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwBHUW+nUopiSQA3AA--.652W
X-CM-SenderInfo: hfkh05pxhex0nj6mt2flof0/1tbiAQAOCmFEYxsksAAAsM
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_00,RCVD_IN_PBL,RDNS_NONE,
        T_SCC_BODY_TEXT_LINE,T_SPF_HELO_PERMERROR,T_SPF_PERMERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

ClRoZSBzdHJsY3B5IHNob3VsZCBub3QgYmUgdXNlZCBiZWNhdXNlIGl0IGRvZXNuJ3QgbGltaXQg
dGhlIHNvdXJjZQpsZW5ndGguICBQcmVmZXJyZWQgaXMgc3Ryc2NweS4KClNpZ25lZC1vZmYtYnk6
IFh1ZUJpbmcgQ2hlbiA8Y2hlbnh1ZWJpbmdAamFyaS5jbj4KLS0tCiBhcmNoL2FybS9tYWNoLXMz
Yy9tYWNoLW1pbmkyNDQwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9tYWNoLXMzYy9tYWNoLW1pbmky
NDQwLmMgYi9hcmNoL2FybS9tYWNoLXMzYy9tYWNoLW1pbmkyNDQwLmMKaW5kZXggNTUxZWM2NjBh
YjU5Li45OGNlYmMwNjUyMWMgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL21hY2gtczNjL21hY2gtbWlu
aTI0NDAuYworKysgYi9hcmNoL2FybS9tYWNoLXMzYy9tYWNoLW1pbmkyNDQwLmMKQEAgLTYyNCw3
ICs2MjQsNyBAQCBzdGF0aWMgY2hhciBtaW5pMjQ0MF9mZWF0dXJlc19zdHJbMTJdIF9faW5pdGRh
dGEgPSAiMHRiIjsKIHN0YXRpYyBpbnQgX19pbml0IG1pbmkyNDQwX2ZlYXR1cmVzX3NldHVwKGNo
YXIgKnN0cikKIHsKIAlpZiAoc3RyKQotCQlzdHJsY3B5KG1pbmkyNDQwX2ZlYXR1cmVzX3N0ciwg
c3RyLAorCQlzdHJzY3B5KG1pbmkyNDQwX2ZlYXR1cmVzX3N0ciwgc3RyLAogCQkJc2l6ZW9mKG1p
bmkyNDQwX2ZlYXR1cmVzX3N0cikpOwogCXJldHVybiAxOwogfQotLSAKMi4zNi4xCg==
