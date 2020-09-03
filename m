Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9A9725C869
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 20:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729033AbgICSEQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 14:04:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:36648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726678AbgICSEN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 14:04:13 -0400
Received: from localhost.localdomain (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB8EE2083B;
        Thu,  3 Sep 2020 18:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599156252;
        bh=sT7o6EOpNo7rJsdd3osBS5zvl18SeJJAjMzSzwH86qk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=z+3wzepo8kkRTBSe6NoYqni+MdpC00uXyZm3iJO5KfMaX6dXdzDK/vOUJ6QoZk18z
         jSK3A6HH32NgPSMVqaKyoEyKCWNfJ0tX5wWGYfG9mUo6bAQwl9y1XsHFNiND0njpOO
         pHbZcYkdluf0jWRlchcSyfTTfmZGWr/QGAPywet0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@samsung.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] crypto: s5p-sss - Add and fix kerneldoc
Date:   Thu,  3 Sep 2020 20:03:59 +0200
Message-Id: <20200903180400.2865-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903180400.2865-1-krzk@kernel.org>
References: <20200903180400.2865-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add missing and fix existing kerneldoc to silence W=1 warnings:

  drivers/crypto/s5p-sss.c:333: warning: Function parameter or member 'pclk' not described in 's5p_aes_dev'
  drivers/crypto/s5p-sss.c:373: warning: Function parameter or member 'sgl' not described in 's5p_hash_reqctx'
  drivers/crypto/s5p-sss.c:373: warning: Function parameter or member 'buffer' not described in 's5p_hash_reqctx'
  drivers/crypto/s5p-sss.c:1143: warning: Function parameter or member 'new_len' not described in 's5p_hash_prepare_sgs'
  drivers/crypto/s5p-sss.c:1143: warning: Excess function parameter 'nbytes' description in 's5p_hash_prepare_sgs'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/crypto/s5p-sss.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 341433fbcc4a..f67f1e22ecd1 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -260,6 +260,7 @@ struct s5p_aes_ctx {
  * struct s5p_aes_dev - Crypto device state container
  * @dev:	Associated device
  * @clk:	Clock for accessing hardware
+ * @pclk:	APB bus clock necessary to access the hardware
  * @ioaddr:	Mapped IO memory region
  * @aes_ioaddr:	Per-varian offset for AES block IO memory
  * @irq_fc:	Feed control interrupt line
@@ -342,13 +343,13 @@ struct s5p_aes_dev {
  * @engine:	Bits for selecting type of HASH in SSS block
  * @sg:		sg for DMA transfer
  * @sg_len:	Length of sg for DMA transfer
- * @sgl[]:	sg for joining buffer and req->src scatterlist
+ * @sgl:	sg for joining buffer and req->src scatterlist
  * @skip:	Skip offset in req->src for current op
  * @total:	Total number of bytes for current request
  * @finup:	Keep state for finup or final.
  * @error:	Keep track of error.
  * @bufcnt:	Number of bytes holded in buffer[]
- * @buffer[]:	For byte(s) from end of req->src in UPDATE op
+ * @buffer:	For byte(s) from end of req->src in UPDATE op
  */
 struct s5p_hash_reqctx {
 	struct s5p_aes_dev	*dd;
@@ -1125,7 +1126,7 @@ static int s5p_hash_copy_sg_lists(struct s5p_hash_reqctx *ctx,
  * s5p_hash_prepare_sgs() - prepare sg for processing
  * @ctx:	request context
  * @sg:		source scatterlist request
- * @nbytes:	number of bytes to process from sg
+ * @new_len:	number of bytes to process from sg
  * @final:	final flag
  *
  * Check two conditions: (1) if buffers in sg have len aligned data, and (2)
-- 
2.17.1

