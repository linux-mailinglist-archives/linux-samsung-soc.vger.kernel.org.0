Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B71C973ED
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 21 Aug 2019 09:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfHUHwC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 21 Aug 2019 03:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbfHUHwC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 03:52:02 -0400
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39AFC22DA7;
        Wed, 21 Aug 2019 07:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566373921;
        bh=hYDZnnUxNBQiUc/M9Pvh8xThL1YtQ/WPA7NOwsHlITE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WUQ/LHgT2B5j4w+5OIgISRHWMlOId1Plh5PF+yyld4DLRCWhDGdBFy98S84g4rwkU
         yd1FaasgyAOh6kmA3WI1SyuCvztPaZPTJfibQx7K98zdhp0RfSj620yfPEWhiIYaDi
         sHiqASWsDCpPbx31l++/fEZLMX80+4OGOuXYuYNE=
Received: by mail-lf1-f53.google.com with SMTP id x3so1080478lfn.6;
        Wed, 21 Aug 2019 00:52:01 -0700 (PDT)
X-Gm-Message-State: APjAAAV2hZdkNtiLYLdJzQG0qsxGIUD2Oya7fPhA8PxhCQ352Lh3iVRI
        3KlZfnR7peeo+m2K7ENbVtSEw7+vtTbx9Rgr2R8=
X-Google-Smtp-Source: APXvYqwWaFdHuhOKUxPiJxtuqDQh+4v8//hbQwO0UA4d7WrCmayyCIO3i8cEO8kbHX7hahgrTKu9nn1yGPlDiwCKLi0=
X-Received: by 2002:a19:f512:: with SMTP id j18mr17081375lfb.159.1566373919501;
 Wed, 21 Aug 2019 00:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190816163042.6604-1-krzk@kernel.org> <20190816163042.6604-2-krzk@kernel.org>
In-Reply-To: <20190816163042.6604-2-krzk@kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 21 Aug 2019 09:51:48 +0200
X-Gmail-Original-Message-ID: <CAJKOXPf6qpGDNxKpUJ+Eby8NS+BhrypA4xy_m1s4GHFA55Q9PQ@mail.gmail.com>
Message-ID: <CAJKOXPf6qpGDNxKpUJ+Eby8NS+BhrypA4xy_m1s4GHFA55Q9PQ@mail.gmail.com>
Subject: Re: [GIT PULL 3/3] ARM: dts: exynos: DT for v5.4
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 16 Aug 2019 at 18:30, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.4
>
> for you to fetch changes up to bfb77169306d5d560a8b62eebaf6d69d02e8d152:
>
>   ARM: dts: exynos: Add CAM power domain to Exynos5422/5800 (2019-08-12 19:02:59 +0200)
>
> ----------------------------------------------------------------
> Samsung DTS ARM changes for v5.4
>
> 1. Add AHCI to Exynos5250,
> 2. Add camera and GPU power domains to Exynos5422,
> 3. Minor cleanup.

Just a reminder - this one pull request is good to go. No changes needed.

Best regards,
Krzysztof
