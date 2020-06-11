Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCAE1F62EF
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 11 Jun 2020 09:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgFKHvP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 11 Jun 2020 03:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgFKHvO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 03:51:14 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E467C08C5C1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2020 00:51:13 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id u13so5237441iol.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jun 2020 00:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ONUNioNywUT4VgW//vYCSrmF2Wr9OMCXF2tDBe1sfWE=;
        b=i9gWWz9IPp64x6mMhpPFfffpxaidDV6/vu/P5boaacl/pojrbtlgZ0lpiDnoqHVQGo
         iUEKW+rZbzq+pytxiH/oV2kQFCYPwB7ij8aF3LzeBTf9YXdMibBEcFOStIEOomF/ryAY
         kHGe6dkB9GES3ZVQCM2lRin2vIqJM6QopxAge3UuUVKpeWmXIhVHTGu8PTaPVXartvK5
         U5l0yLRgtbucfJ2QeBc23y21MRmFeB3BKyW+lxGNArO5l2AFp86Hi1KG/Q8CFVc85uHx
         4jz3gI6msWSu0AFTrWUtHwQnXEFPRczDVgr3oMYr9ccoYcz/eZm5h0a9AaBan0mEnFne
         I+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ONUNioNywUT4VgW//vYCSrmF2Wr9OMCXF2tDBe1sfWE=;
        b=qQQL4JK4eKamgh2yx+dQ0CWYUlD2MVQKFYNCw3Q6jCps0e9jfziANBaODgP8BgE1bq
         58h16lIeKmDKWvEYuSvbl6e/mRvUF10tYg5eOOGETUY0SC/1WLANV2SNISUfTG7kJi8v
         FkvtfiLS4mlWWXMTbWI5ywoM6+wlg2DIbpgQfCt0mdzqhyK54YwKhkFHavh3PwIEieBX
         zS10UF56IewDGDNV8iO3DB26mRptbauONWdLRfx06sSWqYYILejzwkcDoFNcoonCQphN
         9lV2OuiOcGsj9vj8yNPFIo4857Z8VNEeCr8DQMJLAFgEiJORFnrICQpzQr1qE5799g8T
         /QaQ==
X-Gm-Message-State: AOAM5324zQeLiCV0pHkcY87E6AY7y7Rt78AGlMSgbTgRZNqMzq5CBbLm
        7LkVggF/Yf6P9UvBgYECkoN5b53JGCRw/YG80/E=
X-Google-Smtp-Source: ABdhPJxA5awFItV4FZOEM8/x+OfRjhuRNUxu8Oh1EYvo8rUJI830IZSKlnthlXoQGq1Y57+YW+KdPwPu3STAF6gR6To=
X-Received: by 2002:a6b:7d07:: with SMTP id c7mr7236552ioq.159.1591861872147;
 Thu, 11 Jun 2020 00:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <CANAwSgQv9BKV4QfZAgSfFQvO7ftcFyCGXEo+g4pgQA4mgK52iQ@mail.gmail.com>
 <20200611064556.GA5056@kozik-lap>
In-Reply-To: <20200611064556.GA5056@kozik-lap>
From:   Anand Moon <linux.amoon@gmail.com>
Date:   Thu, 11 Jun 2020 13:21:01 +0530
Message-ID: <CANAwSgQqW6+W2=QcrAx8DsafK_0eMtQthQWcZWy9NDWxN3WkbQ@mail.gmail.com>
Subject: Re: ARM: warning: relocation out of range on Exynos XU4 and U3+
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On Thu, 11 Jun 2020 at 12:15, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, Jun 11, 2020 at 11:13:57AM +0530, Anand Moon wrote:
> > Hi All,
> >
> > I would like to report some warnings I observed on pre-compiled kernel
> > image (5.7.1-1-ARCH) from Archlinux.
> > Sometimes ethernet would not come up and get connected, so in order to
> > investigate.
> > I found below warnings, So I am sharing the logs at my end.
> >
> > Are these warnings related to in-consistency in locking, How can we
> > Investigate more to fix this issue.
>
> These rather look like some address space randomization or some compiler
> (LLVM?) feature. Not Exynos-specific anyway.
>
> You should report it to Arch folks because they know how they compiled
> the kernel and what config they used (althogh config you can find in
> /proc/config.gz).

Thanks for your inputs.
Ok I will do more checks at my end, before reporting further to Archlinux.

>
> Best regards,
> Krzysztof
>

Best Regards
-Anand
