Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2A1430B20
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 17 Oct 2021 19:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344357AbhJQRTi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 17 Oct 2021 13:19:38 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35406
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229809AbhJQRTh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 17 Oct 2021 13:19:37 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D11943FFF9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 17:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634491046;
        bh=eVflprpswMNhSOShQaGnMDCR95Lqa8YXm16PQlN3/zc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=hZoMYaydGL0F06I/pOOLJa/6BxmrTRx12KrHpTbSNpq95VCYCAH3QXRV9hiRrvQVr
         1hwVdgIgtlZUVr19ibMzqmhtRUTTqTa0JRvHu9rQ60iw/ai5xMdsGAt8T1c2hjsu3c
         VKJ3Zk+rv5MV3oTe00MFKdblr1/TBYdvqz9ISHTXPsAhQCIFIG9DxsYEkgp/r1AloV
         CZKKdRxYX5WaBDEUIhPj34gPNpy0Xr/zgZlIhAErK8SAMOoPfSuigE9zYDsRM+OtMs
         9Xfk2PAD/kpCxWHbsiuW81wxoxem1Nu0p6mzM3ZF9Z36CBATYRQ/gBYpZGOXmW5McD
         mVu24f+e5id/w==
Received: by mail-lj1-f199.google.com with SMTP id y17-20020a2e95d1000000b00210c3d67c45so578523ljh.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 17 Oct 2021 10:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVflprpswMNhSOShQaGnMDCR95Lqa8YXm16PQlN3/zc=;
        b=Eesx7QTRJ2AMKK910kVGJSLY3cJog9lR7ZfsxxHbCBHdRCVYGh49wFSutjYL85X6en
         m0SZBdnOSOWVOONdC3kvCshl+GUD1UWNCcSFXQyz0CHx49scmrkSI/nrrbl71P35w74n
         89Ck1mjG94h+Wc4+WomxsDM+E+gT7rWXqHsxIBdvHnqkvOWrdcPe2yQD/v9y6oFQvJj0
         3bqCJNYJfWw9jpA+BRueUzCQ4EVuHbiZTgrQJ4kYjfbyTlvrgiGPZ7DPkV9yn1F3k/DF
         R9QBzICP3H3TU1vqK7ctxPUvSCoVN9+t4MxZgJA565STti4yXvKl+exrvzV2CNdBN4tA
         RV7g==
X-Gm-Message-State: AOAM532bChXObRZnQaHMUN3IyB5quzbgvbvfO4FolDa6+8MGjpjliaKX
        9UeoXNiwNNYm9PptqdK2sD9YAnuQ83B77Ibg1/OAeqadtPHXujSkvmKvf56Y6hsXaruMg8Va15z
        jE4uCZeyzljziQNyOscsBQMzhkgwBfmV8vWIaKtLuj60Hqpcj
X-Received: by 2002:a05:6512:1024:: with SMTP id r4mr24514271lfr.369.1634491045944;
        Sun, 17 Oct 2021 10:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye9QuKKUoWxFQss3whtnHm3R9a1la2Zo3yqht5gQUUcY0PsrMwRvY7S1sdqpmDQUgCISjEtg==
X-Received: by 2002:a05:6512:1024:: with SMTP id r4mr24514255lfr.369.1634491045791;
        Sun, 17 Oct 2021 10:17:25 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s17sm1286475lfe.10.2021.10.17.10.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 10:17:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will McVicker <willmcvicker@google.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3] rtc: s3c: remove HAVE_S3C_RTC in favor of direct dependencies
Date:   Sun, 17 Oct 2021 19:17:23 +0200
Message-Id: <163449103927.4649.126852181251730907.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013212256.3425889-1-willmcvicker@google.com>
References: <20211013212256.3425889-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 13 Oct 2021 21:22:55 +0000, Will McVicker wrote:
> The config HAVE_S3C_RTC is not really needed since we can simply just
> add the dependencies directly to RTC_DRV_S3C. Also, one less config to
> keep track of!
> 
> 

Applied, thanks!

[1/1] rtc: s3c: remove HAVE_S3C_RTC in favor of direct dependencies
      commit: d96890fca9fd429dd3834dae27e1047760da245b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
