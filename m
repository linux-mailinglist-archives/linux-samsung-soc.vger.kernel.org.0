Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBEB4F3892
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  5 Apr 2022 16:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbiDELZl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 5 Apr 2022 07:25:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348559AbiDEKr0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Apr 2022 06:47:26 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454C752E44;
        Tue,  5 Apr 2022 03:27:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A8ED8CE0B18;
        Tue,  5 Apr 2022 10:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A68FC385A0;
        Tue,  5 Apr 2022 10:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1649154432;
        bh=oHWJVGZerJimRvn7YMHPGhT+6D1L6vxaa4SWJ8iflK4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TfOk944POWLq+1CAZO8AjyBQ9TQDw/Ppi+FpQg2nYj5qQgyQEreXnJY2KvLJQJhkU
         xnuZY+sym+6U4nzW1jnMFXjv/ckQ1yzNiRQmRQ0kfaIZ89OGeEF9kDVVQK9eZ7aMHK
         Yr0KNhEQqkomkT1siiGPKWfeVR5KfqGseH2bw0AA=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Ben Dooks <ben-linux@fluff.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, patches@armlinux.org.uk,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 5.10 577/599] ARM: 9187/1: JIVE: fix return value of __setup handler
Date:   Tue,  5 Apr 2022 09:34:31 +0200
Message-Id: <20220405070316.013498415@linuxfoundation.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405070258.802373272@linuxfoundation.org>
References: <20220405070258.802373272@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

commit 8b2360c7157b462c4870d447d1e65d30ef31f9aa upstream.

__setup() handlers should return 1 to obsolete_checksetup() in
init/main.c to indicate that the boot option has been handled.
A return of 0 causes the boot option/value to be listed as an Unknown
kernel parameter and added to init's (limited) argument or environment
strings. Also, error return codes don't mean anything to
obsolete_checksetup() -- only non-zero (usually 1) or zero.
So return 1 from jive_mtdset().

Fixes: 9db829f485c5 ("[ARM] JIVE: Initial machine support for Logitech Jive")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: patches@armlinux.org.uk
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm/mach-s3c/mach-jive.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/arch/arm/mach-s3c/mach-jive.c
+++ b/arch/arm/mach-s3c/mach-jive.c
@@ -236,11 +236,11 @@ static int __init jive_mtdset(char *opti
 	unsigned long set;
 
 	if (options == NULL || options[0] == '\0')
-		return 0;
+		return 1;
 
 	if (kstrtoul(options, 10, &set)) {
 		printk(KERN_ERR "failed to parse mtdset=%s\n", options);
-		return 0;
+		return 1;
 	}
 
 	switch (set) {
@@ -255,7 +255,7 @@ static int __init jive_mtdset(char *opti
 		       "using default.", set);
 	}
 
-	return 0;
+	return 1;
 }
 
 /* parse the mtdset= option given to the kernel command line */


