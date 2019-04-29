Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 525D9DCA6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Apr 2019 09:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfD2HLu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 29 Apr 2019 03:11:50 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:43206 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbfD2HLu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 03:11:50 -0400
Received: by mail-io1-f67.google.com with SMTP id v9so8031258iol.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2019 00:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZtHuV4JUivTfwBqqXIvSzfQ5NYcx2yRMMOn4vVLdck=;
        b=zMq5h3LXI6dFcJu2i6XOStKa+tM16fFtWD7+tgYSvW+9c2o4N+upRwaKX3gJJ5vQr0
         lpJ1V3qgGa5UmrW7e3Etm5SVFEVrBLPpP4Y/UswM0QsARC9k8CrZPpSAGgHEd5ietLH+
         5JozCLefPjHuV9AskOy3Qup+cASN5AX1nhTDtx9IiJ2Bcfbr1uYEgsReF6jA5pTdOwxx
         RyxGEkCaySvJsij91WfNnrXR1Z0MPs432l1DTEOcsa/plnOkuK0mWfYrM2beOh0cmJQC
         AvOV6v/RTgja9IziLqxzgqGUjae063EeaBFsfV36gi6kg6zlpU2BmyJRaS0h7KfxhJc8
         KMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZtHuV4JUivTfwBqqXIvSzfQ5NYcx2yRMMOn4vVLdck=;
        b=oi0CcArCg9uwZix+ouCw4cxlb5DPRN+75veZn6Y8oAHIgoNr07h0deQ/lEVqNs8V96
         kfnjA1kGA8h/qkzBI3XkQzxqvxSEAkeJA2dXjm98IAK19rfHXWnzdeYZUv37yoWKYcxw
         VBN7+ems/hmPjHcxHDt5J8/Qcw7OWcN7qmmmDLBacoF1oATAuPhmKkvF4OawYPI1lNHB
         9XHiERXj6glcDePCVMSJNGbcGX5j6npFPIeV6mH39Prlp4lPlvnII1aL4LNkyxvzT43D
         ql9KNypVOE5cQJ3xFsmo1/FN/GMLed889eJ1GcUgPNsxG0qHPL7E69ualY37xU3Uldos
         qtYQ==
X-Gm-Message-State: APjAAAVIEKO0SKb0BRvviONkv/wveFSFLBuM+TX28L9JCnLw4TxGsHUv
        K0G6koJQr4zyk1gcXiW/3bDkS0/UjESKQ7c0IaWKoA==
X-Google-Smtp-Source: APXvYqy2NI0iAuUdXJt55fsNTPkhEPdO1qf8e3D8P12eYuAI66Rx7WjCDUuoAw8iwuybwsvy9TFZxSF/ySRELQ71P4Q=
X-Received: by 2002:a6b:fe0f:: with SMTP id x15mr19992622ioh.78.1556521909778;
 Mon, 29 Apr 2019 00:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190414154805.10188-1-krzk@kernel.org> <20190414154805.10188-3-krzk@kernel.org>
 <CAJKOXPfzV0wn0a-4xvy1B0fR=X4VvpqNmtqwRGFhFdCMH3OpHA@mail.gmail.com>
In-Reply-To: <CAJKOXPfzV0wn0a-4xvy1B0fR=X4VvpqNmtqwRGFhFdCMH3OpHA@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 29 Apr 2019 00:11:38 -0700
Message-ID: <CAOesGMh1JA=RxrnohosW1SiwZrwDy_1mHNMBq2zrYXEFcCuEzQ@mail.gmail.com>
Subject: Re: [GIT PULL 3/3] ARM: samsung: Changes for v5.2
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        ARM-SoC Maintainers <arm@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Apr 28, 2019 at 11:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sun, 14 Apr 2019 at 17:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> >
> > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> >
> >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.2
> >
> > for you to fetch changes up to 7676e667c841375b41d9438b559756141aa93d0e:
> >
> >   ARM: s3c64xx: Tidy up handling of regulator GPIO lookups (2019-04-14 12:53:03 +0200)
> >
> > ----------------------------------------------------------------
> > Samsung mach/soc changes for v5.2
> >
> > 1. Cleanup in mach code.
> > 2. Add necessary fixes for Suspend to RAM on Exynos5422 boards (tested
> >    with Odroid XU3/XU4/HC1 family).  Finally this brings a working S2R
> >    on these Odroid boards (still other drivers might have some issues
> >    but mach code seems to be finished).
> > 3. Require MCPM for Exynos542x boards because otherwise not all of cores
> >    will come online.
> > 4. GPIO regulator cleanup on S3C6410 Craig.
>
> Hi Olof and Arnd,
>
> I see you pulled in DTS and DTS64 pull request. I think this one here
> is still pending.

Yeah, I don't always do them in order. It's easier to sweep all pull
requests of a certain type (i.e. DT, drivers, etc). I also ran out of
time and had to step away for a few hours.

Same thing now -- I'm done for the night but there's quite a few
remaining pull requests in the queue. I'll continue tomorrow.


-Olof
