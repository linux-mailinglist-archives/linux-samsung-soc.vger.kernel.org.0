Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4B7792698
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 19 Aug 2019 16:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbfHSOYJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 19 Aug 2019 10:24:09 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54463 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfHSOYJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 10:24:09 -0400
Received: by mail-wm1-f66.google.com with SMTP id p74so1801240wme.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2019 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=okCdUHYHWt8s+0k5Gl5UgSWbhxR2JAmRuhLJNchPGYI=;
        b=CIAwk/2xz5Fk3vpsS5zaUx5blmwut8crvHyNuE1nZV7u49BJOzwxN+pcuH007DJF9X
         MnH1y5G9MnyJE+DGRdBqswFOhlHsVdGgGFwDWtdmNU3GQWQZBt5hnymnkWsyx9FNt8iJ
         BNSyrC3Nh6tjtztCCQjW9y3BMd4BRKWGaulhagaIJqq/BpRRW/pSDdebDXS1763t14Ma
         o3mMv55QwC9jySRQf/uLrIuZmFrm2nWOMAzlwfmIGF4wWfCZikKrlvD0KcC7vJfuXDZB
         +UCNpavKC4HW5TLPWRwEjG4AkY/vyRYAzwfZqVeIou7qYmOuzvfUJo8u2h8iTlx1IMsT
         72zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=okCdUHYHWt8s+0k5Gl5UgSWbhxR2JAmRuhLJNchPGYI=;
        b=rSzjPOp4A5AuQSz5HR5GCkW2mbzDgluiF6dvrxTRpefP/BbNOz2Gf4d3ZHeZ7lv9UK
         G8jY6HeeIkX6Kj9D07gHAFNllrro8Gc6oHOadawkwj2M6B7YpvICGmtE7rtae4bKES+9
         efpFtzRNp2kpMgSWjnORCpMMuk0Zea8D2R091F4go3JB/RgPy51SV26FNthEtawJnSSd
         0ZShBD/y43b+1pUAmMNSUWztCe+bSKPx+edLdSMoR+JkTpiG9SK9DpITtPfRc+wNIQ5K
         WYqKiRI/16pNnmy/XOKhZX7+pS7nbyRbX+wDdzKVFNq+B42vW6WbDO7VggfjvyGVhAav
         U2HQ==
X-Gm-Message-State: APjAAAUZn1HRGWoHadDwUVu026DyTgJusB8Sjd7wIBxR6vx8tjLk9etT
        IpSR7oXXDe4/iJ/j9xiGbBjo5bcJRT8xEw==
X-Google-Smtp-Source: APXvYqzLJ657/WQvIhrtl+/1INZDJrbRbFhnGrWe3DRgCNYGkxPq1v84s8c8ACnaplqfEsLwbpG2ww==
X-Received: by 2002:a1c:1a87:: with SMTP id a129mr20621847wma.21.1566224647192;
        Mon, 19 Aug 2019 07:24:07 -0700 (PDT)
Received: from localhost.localdomain (11.172.185.81.rev.sfr.net. [81.185.172.11])
        by smtp.gmail.com with ESMTPSA id o17sm13643356wrx.60.2019.08.19.07.22.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 07:24:06 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] crypto: s5p - deal gracefully with bogus input sizes
Date:   Mon, 19 Aug 2019 17:22:25 +0300
Message-Id: <20190819142226.1703-2-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819142226.1703-1-ard.biesheuvel@linaro.org>
References: <20190819142226.1703-1-ard.biesheuvel@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The s5p skcipher driver returns -EINVAL for zero length inputs, which
deviates from the behavior of the generic ECB template, and causes fuzz
tests to fail. In cases where the input is not a multiple of the AES
block size (and the chaining mode is not CTR), it prints an error to
the kernel log, which is a thing we usually try to avoid in response
to situations that can be triggered by unprivileged users.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/crypto/s5p-sss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index 9ef25230c199..ef90c58edb1f 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -2056,9 +2056,12 @@ static int s5p_aes_crypt(struct ablkcipher_request *req, unsigned long mode)
 	struct s5p_aes_ctx *ctx = crypto_ablkcipher_ctx(tfm);
 	struct s5p_aes_dev *dev = ctx->dev;
 
+	if (!req->nbytes)
+		return 0;
+
 	if (!IS_ALIGNED(req->nbytes, AES_BLOCK_SIZE) &&
 			((mode & FLAGS_AES_MODE_MASK) != FLAGS_AES_CTR)) {
-		dev_err(dev->dev, "request size is not exact amount of AES blocks\n");
+		dev_dbg(dev->dev, "request size is not exact amount of AES blocks\n");
 		return -EINVAL;
 	}
 
-- 
2.17.1

