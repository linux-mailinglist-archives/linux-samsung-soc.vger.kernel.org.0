Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3113513BD2E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Jan 2020 11:13:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729634AbgAOKNd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 15 Jan 2020 05:13:33 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44617 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729598AbgAOKNd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 05:13:33 -0500
Received: by mail-lf1-f67.google.com with SMTP id v201so12243338lfa.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2020 02:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vO4qe02zao/A+ruoIXV88YhdBiNPhMumkEGKgg4RymM=;
        b=i0Kvn+Ey9/+U8pQ6/uBTFMH5I8IA+l8DqIupDU57PCn5oW+xM8FTvK9P7H8tLqGF5D
         cRk7hsCmntfXi0iXXggSozStVld6pLWOkD2y/Yqs4VSnXLYA2zx4an1gTT/j/30F7Enm
         hMmu7rUyi/ywMOG/7JsdqwIpD1sGfVL2aN9EHANJ+yWlIKA6x3J+iuOFXzqAE1ziZWQS
         goLWInYuXbPP6FAUWz9ROEzeW9jgydpzRLd82aBT9AQSx2NvCpCSGbaJmJnk97vFA/s/
         mKm3nQBzK4XkJYSohl7AB6oERKp8mwXOFi9brhB15oJluvGQw+MUkEhLZdqD6EtMEO3x
         tQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vO4qe02zao/A+ruoIXV88YhdBiNPhMumkEGKgg4RymM=;
        b=Q+BWh1vUHwgK9IezDwMV2D9JShpmrMBHZtk8CMbO1SNW+3kjUOHfDjFxslEj+kmXcu
         L1uIQ+x6uUOnbYpV/UbrMzRVV0pGk1DZfQn5fF59QEuzkWpPZuLUV7gs7P5Id3GIufhQ
         XoqHhFuBSunNU+kZLZjBgcxk8tztM1np1ZghkM+gFbQwfdv7w1qOqTf0P0DFjT5uLQMK
         Css6XeBgPIAKT5Up01SYmZbpxQJkfsnMbwVnlOgXJnezPpJSbJNdQbPQUdBaJbbYD9KF
         NkaEINf6P5jzqAT0eucfSW6X9aQT1Cw9fofJetLrqZ3rrssysQcrCGOVFNP/NAChjQ8h
         pa8g==
X-Gm-Message-State: APjAAAW0hHK3UWNv4lPnvpavkWnmEvJ3kQrUqlKHnlcoJvBttGbHxzCs
        nCKQmfwasYodQr12SHIk3LqMiq0DmIDeMFOPvAFfnjHfjg4=
X-Google-Smtp-Source: APXvYqyjpPJG2PlBkvker2pjrEMpaojUIm0M1qm4uQATc9Ei5oB+Qf3k1pXdKzW50LZY13BsnF1kUP4nXB8QRKn3Zq0=
X-Received: by 2002:ac2:465e:: with SMTP id s30mr4450440lfo.134.1579083211682;
 Wed, 15 Jan 2020 02:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20200110174426.5463-1-krzk@kernel.org>
In-Reply-To: <20200110174426.5463-1-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 11:13:20 +0100
Message-ID: <CACRpkdY+wC3xx9r-4rsCeV3xJQbDoV8u9+9UGJ_9Kg9Swn87jg@mail.gmail.com>
Subject: Re: [GIT PULL] pinctrl: samsung: Pull for v5.6
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jan 10, 2020 at 6:44 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:
>
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-5.6
>
> for you to fetch changes up to 225a2ec19aac426ef29f0e4accfc890c87d38bdc:
>
>   pinctrl: samsung: Fix missing OF and GPIOLIB dependency on S3C24xx and S3C64xx (2019-12-15 12:47:52 +0100)

Pulled in to my "devel" branch, thanks!

Yours,
Linus Walleij
