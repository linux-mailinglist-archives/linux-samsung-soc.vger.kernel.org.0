Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122929269A
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 19 Aug 2019 16:24:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726343AbfHSOYL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 19 Aug 2019 10:24:11 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54031 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726186AbfHSOYL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 10:24:11 -0400
Received: by mail-wm1-f65.google.com with SMTP id 10so1803897wmp.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2019 07:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Ze9YdeG54uGI/7oCptuYPG1qBhEdnJDuSAQDXLeVnX8=;
        b=dDjKzbkH+8BuYJwEP1RMQY7sy1oABKnDPP6BZiuKeRpsp1tRLXNnZuDXQfS2QxV9wu
         2Ndjj6gIYsj46tlKHLfCAl0hUJXoTnQymqYntNbhx2KyNdty+5H398adZV9NFh+bHEZw
         M/GNc2IAga8TN5JRedboXn68L9aHaGiPe33lnS3CB0DwT48xGzxuRU/WZxdwYqeLTlEr
         0/8AQKldpcdz0u2su35MkNWYOkYYzsTUX230d01gOf6w3kmfEoXDOjrMHswvZHT10D9A
         vfakDyKoQ4heQd5Q61UiKtBlf+PIrUqTPdy2ZFOdxbpznrVayWnD7iZd5gA3qTZLl2xh
         CqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Ze9YdeG54uGI/7oCptuYPG1qBhEdnJDuSAQDXLeVnX8=;
        b=GHOiD0X7WjU3zDVmZdUV1fatFczZ+nl9A8t0PC9fx2ttpXH4xiWXJi+yK0kOyQJbiO
         9jacZeQmNThLmQzbALkQGBFBdrUhMXGBFsbCj2QfpgwMDlMlSxzgoed3ywcIiPlvWR4/
         cAeibINrEA70XnrmYCES8ZdD+n4Tw2D3eirUm3fSy1+Ft0TNHTRvIsKqaV/EnXj1BIP+
         BcFst+6aGcIyQwsqz8K2YclLG20BKCmOUlvtBjZevqWw2CzU3uIImbFDDL8zjkgMJ3gx
         MOAbIRs5lnkxMleC5SUFDL4nxy/pGoBDN46nP/3/S5FqG31ZMX/1A19KnBOdUrbs8+2T
         ZyxQ==
X-Gm-Message-State: APjAAAWAgc1F5GtJHhCMpthSJadqBxPzS892iipnTXCOCGEP8BA6r+Re
        kavvj1DTmlpVMbG8KNs2fUjwog==
X-Google-Smtp-Source: APXvYqygMJUa/tZIg/byfGERZ+ObqMC3mPulIseS0856HX0WwZs8zbz1LXPdnk3TxkpIcf5Aetlp3A==
X-Received: by 2002:a1c:1d42:: with SMTP id d63mr19913988wmd.34.1566224649604;
        Mon, 19 Aug 2019 07:24:09 -0700 (PDT)
Received: from localhost.localdomain (11.172.185.81.rev.sfr.net. [81.185.172.11])
        by smtp.gmail.com with ESMTPSA id o17sm13643356wrx.60.2019.08.19.07.24.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 07:24:09 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] crypto: s5p - use correct block size of 1 for ctr(aes)
Date:   Mon, 19 Aug 2019 17:22:26 +0300
Message-Id: <20190819142226.1703-3-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819142226.1703-1-ard.biesheuvel@linaro.org>
References: <20190819142226.1703-1-ard.biesheuvel@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Align the s5p ctr(aes) implementation with other implementations
of the same mode, by setting the block size to 1.

Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 drivers/crypto/s5p-sss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/s5p-sss.c b/drivers/crypto/s5p-sss.c
index ef90c58edb1f..010f1bb20dad 100644
--- a/drivers/crypto/s5p-sss.c
+++ b/drivers/crypto/s5p-sss.c
@@ -2173,7 +2173,7 @@ static struct crypto_alg algs[] = {
 		.cra_flags		= CRYPTO_ALG_TYPE_ABLKCIPHER |
 					  CRYPTO_ALG_ASYNC |
 					  CRYPTO_ALG_KERN_DRIVER_ONLY,
-		.cra_blocksize		= AES_BLOCK_SIZE,
+		.cra_blocksize		= 1,
 		.cra_ctxsize		= sizeof(struct s5p_aes_ctx),
 		.cra_alignmask		= 0x0f,
 		.cra_type		= &crypto_ablkcipher_type,
-- 
2.17.1

