Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 728C93FC558
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 31 Aug 2021 12:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239629AbhHaJ6x (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 31 Aug 2021 05:58:53 -0400
Received: from out2.migadu.com ([188.165.223.204]:15968 "EHLO out2.migadu.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240818AbhHaJ6w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Aug 2021 05:58:52 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1630403876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jZo+zpRo7Ip3j/xVyPOUGYykymGrVU6itaCV5ibszlM=;
        b=KtzktEmCeQ6jwsPfOTtNvASUr3Qmwzw7EdMmJ1K9H+SysAekpX7Q0CaVnZlLaAXqpTXJyt
        ULFR0pS1ZuWFYAvS0/TTl/eAcjdgs17qln33lo+qxQJqEcD2u9atdHglsjewQNl8m3sFmp
        WfvLa7Sf3IB4yNRu0eT7Mi0nMS0Hmi4=
From:   Jackie Liu <liu.yun@linux.dev>
To:     krzysztof.kozlowski@canonical.com
Cc:     linux-samsung-soc@vger.kernel.org, liuyun01@kylinos.cn
Subject: [PATCH] ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()
Date:   Tue, 31 Aug 2021 17:57:28 +0800
Message-Id: <20210831095728.2447598-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: liu.yun@linux.dev
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Jackie Liu <liuyun01@kylinos.cn>

The s3c24xx_init_intc() returns an error pointer upon failure, not NULL.
let's add an error pointer check in s3c24xx_handle_irq.

Fixes: 1f629b7a3ced ("ARM: S3C24XX: transform irq handling into a declarative form")
Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
---
 arch/arm/mach-s3c/irq-s3c24xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c/irq-s3c24xx.c b/arch/arm/mach-s3c/irq-s3c24xx.c
index 0c631c14a817..d58bf0f9bf9a 100644
--- a/arch/arm/mach-s3c/irq-s3c24xx.c
+++ b/arch/arm/mach-s3c/irq-s3c24xx.c
@@ -362,11 +362,11 @@ static inline int s3c24xx_handle_intc(struct s3c_irq_intc *intc,
 static asmlinkage void __exception_irq_entry s3c24xx_handle_irq(struct pt_regs *regs)
 {
 	do {
-		if (likely(s3c_intc[0]))
+		if (likely(!IS_ERR_OR_NULL(s3c_intc[0])))
 			if (s3c24xx_handle_intc(s3c_intc[0], regs, 0))
 				continue;
 
-		if (s3c_intc[2])
+		if (!IS_ERR_OR_NULL(s3c_intc[2]))
 			if (s3c24xx_handle_intc(s3c_intc[2], regs, 64))
 				continue;
 
-- 
2.25.1

