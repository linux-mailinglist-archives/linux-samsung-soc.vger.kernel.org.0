Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 646C392686
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 19 Aug 2019 16:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfHSOW3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 19 Aug 2019 10:22:29 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51083 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfHSOW3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Aug 2019 10:22:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id v15so1805490wml.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Aug 2019 07:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=PugF/khGc++UobH1xigOCuI7JbK9qCa/EKqEGByRJRU=;
        b=Fzb/ft5nGpUaHHxIAvT13NCjBo86kQICK7LGGiczPOiObAmTUfRWmQdFcGoDz5rVAv
         e75NVMZufZNgJcLSCaalbU5QxV3w2uLA21z9/G3K2C3egqGTQqhYfljN4/iiBuoIONE1
         xroek9zBQQN6Sp38EmjCAaudQ06dtG4R+qUL3lBYeztjO2FARCBLSKDsxI/SpqnZDcUN
         EZ3mk6VL0cvl4O+DcRVh1EIOCU7W/2mUxyoZOgGd6Ww9BzPiv2W5phftJVHMGk/jOVV3
         Yx2KK7eTmyWo9GRCSQSV6gVs07x8WtAYFA+8vzft/TgFJ4+npsIg8Idfjv871m1/eG8W
         uobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PugF/khGc++UobH1xigOCuI7JbK9qCa/EKqEGByRJRU=;
        b=dTi45ID6AyBArIeGWBNj7G7mknOur+U4cG2WNNb2BGeVgnLOrBe/8EJeWvIXJVTrPG
         BJHLPQpqdnMA+ujPldcMWu9hwTy6GY+o1Ql60bvXuyBGTfekc7SwxJGhxip4ke6QHW+s
         w/A/9OwGVki9syt30R9T1HJ6j2pR5lEX4FQLGytAukK3FwMhXhuZEoUaPQOCofPiMVlJ
         b1AX3IP/bM9HC2Yw8m/J6V0PqnQTmX8mui+4TOkFRuXG+arkKoqoGfqeL+gdejSKszNK
         r0FoOYKWZIrC/J5j7CZsWXLwQSFAiYOdN1JFSAkNYpfWZt5XY5LmP9sUJ4lQuM33JfYU
         U5BA==
X-Gm-Message-State: APjAAAVQZDVl/Ya0vHtYJPDxpfEQVscZDGK184XO+Z5ofvRrX9k+oY4o
        6YTzTQ/lkO5qvxkqbkW7JqCQFg==
X-Google-Smtp-Source: APXvYqyyDSK++hWJZPoyNGbwoPY0194tL8S7EInbScrh9+gVW9c9VjbBJLY/pjYdMveWUf17b1c2nA==
X-Received: by 2002:a1c:7606:: with SMTP id r6mr20234780wmc.118.1566224547164;
        Mon, 19 Aug 2019 07:22:27 -0700 (PDT)
Received: from localhost.localdomain (11.172.185.81.rev.sfr.net. [81.185.172.11])
        by smtp.gmail.com with ESMTPSA id o17sm13643356wrx.60.2019.08.19.07.22.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 07:22:26 -0700 (PDT)
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
To:     linux-crypto@vger.kernel.org
Cc:     herbert@gondor.apana.org.au,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/2] drivers/crypto - s5p fixes
Date:   Mon, 19 Aug 2019 17:22:24 +0300
Message-Id: <20190819142226.1703-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix a couple of issues in the s5p crypto driver that were caught in fuzz
testing.

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Ard Biesheuvel (2):
  crypto: s5p - deal gracefully with bogus input sizes
  crypto: s5p - use correct block size of 1 for ctr(aes)

 drivers/crypto/s5p-sss.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.17.1

