Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2C7A93E1
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 22:39:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfIDUjj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 16:39:39 -0400
Received: from mail-qk1-f179.google.com ([209.85.222.179]:39359 "EHLO
        mail-qk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726834AbfIDUjj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 16:39:39 -0400
Received: by mail-qk1-f179.google.com with SMTP id 4so21013837qki.6;
        Wed, 04 Sep 2019 13:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uq0zv2UkiJLjMjjKeNFbujc9fQrnyLYzOUVctKFpAkM=;
        b=iuvxy1wxRP48ngZ7I7YvRlbWxwBNdYmdIR0jGJOhFmPWVmsKVmdj9xd8XkH2XBCdzT
         gevlx8mRfMe8RPpiPyXv4ExSNaD/XB3fsmSkAW7AMph17ICv4dvX9LoGKcEaF2l9NnHg
         ZpKsLGEPHQHwX+qK7v6DxtLNJLB0tnewlRzLDaQ3kPxLAciXFDcy8vZo6y0B5e03EwgU
         D3UFad1Vxv97/sv50ByXjLYAgg+VhNXcMtH4PDgkEmBJtoLO2hlOW8lURkGYcppBxXqS
         xiy1zXqe3Pmp8IspHkHGVhdW5f1L988MjcrYevaqmdDlJvV0GdTlxGq4oZMrK8LsqEtK
         Zwbg==
X-Gm-Message-State: APjAAAXdTc7ZQQk+0Mz/O7gUK10aWos5Zx77SLIOZieZF1XkQs6jDlbn
        U9UVD1PZTDzyCVIR9xuopc/t28WHFcrP4a5XiDc=
X-Google-Smtp-Source: APXvYqz8lBuhlOPSvE0tDe5CevBPyAHsWAlq05grbhyPia69P41xYFoLaGo8IrpgS8oFCmKZsll/AUJSZYswal64Qho=
X-Received: by 2002:a37:4fcf:: with SMTP id d198mr41439228qkb.394.1567629578540;
 Wed, 04 Sep 2019 13:39:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190904175002.10487-1-krzk@kernel.org> <20190904175002.10487-5-krzk@kernel.org>
In-Reply-To: <20190904175002.10487-5-krzk@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 4 Sep 2019 22:39:22 +0200
Message-ID: <CAK8P3a3GKUXWoJvSj_g=Dqv=RZfpFP7vsTBCPC_ts6S5BBTBkA@mail.gmail.com>
Subject: Re: [GIT PULL 4/5] ARM: samsung: mach for v5.4, second (replacing previous)
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, arm-soc <arm@kernel.org>,
        SoC Team <soc@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 4, 2019 at 7:50 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Samsung mach/soc changes for v5.4
>
> 1. Minor fixup in plat and mach code (S3C platforms),
> 2. Enable exynos-chipid driver to provide SoC related information,
> 3. Extend the patterns for Samsung maintainer entries to cover all
>    important files.

Pulled into arm/soc, thanks!

        Arnd
