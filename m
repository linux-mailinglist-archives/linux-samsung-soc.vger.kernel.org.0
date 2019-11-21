Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 591CA1052C9
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 21 Nov 2019 14:19:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfKUNTJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 21 Nov 2019 08:19:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:41714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbfKUNTJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 08:19:09 -0500
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 836C420679;
        Thu, 21 Nov 2019 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574342348;
        bh=ZEYOionnWXELaynCgxS4yAZnqBi6NuNFEWyI/JsG6AU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sdVVGM5bXGvYzrMgUuRFVwO3BlprakPxBEXRqMQDryMgYTI/j8eLcCfBvLBrFayJw
         vW11pyW87CLs3zc/Bp56Ey5BMreeZ0rBlciuXQ6mXpqOVmbkhaUbpn0YvlW13AWuQF
         m9MapoGpoDBlUGFrkjY+An/xISWqyxjHS11HYmA4=
Received: by mail-lj1-f172.google.com with SMTP id e9so3130562ljp.13;
        Thu, 21 Nov 2019 05:19:08 -0800 (PST)
X-Gm-Message-State: APjAAAXWB4mBt2pvP3bxvDywRGKY179Psg5dEbAQ6Gu87kY6KIcRHsT6
        TwlEXjxbkr1Zk8wsAdnhPfPsRO8LDvH9KcKa57o=
X-Google-Smtp-Source: APXvYqwAmSGQjQIdEOzLO4tcnuIsYyKuJ+fIYOgNXqdIuMZiXtR2mG6CMX3BTsww/ypD+13vSGEJbtaSOurxQeBonZg=
X-Received: by 2002:a2e:8855:: with SMTP id z21mr7700993ljj.212.1574342346684;
 Thu, 21 Nov 2019 05:19:06 -0800 (PST)
MIME-Version: 1.0
References: <CGME20191120135541eucas1p14033edaac4d015cf1d2110d9d08f2f05@eucas1p1.samsung.com>
 <20191120135527.7636-1-k.konieczny@samsung.com> <CAJKOXPefL_nyNaUExCJv6zKmhPTvgiPaaPT-sRoyyOw59aTZiQ@mail.gmail.com>
 <1bd50b4b-a40a-a0c1-48ce-60e69b11ec3f@samsung.com>
In-Reply-To: <1bd50b4b-a40a-a0c1-48ce-60e69b11ec3f@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 21 Nov 2019 21:18:55 +0800
X-Gmail-Original-Message-ID: <CAJKOXPfjLc7R21d2gm6fntwFks8fLNiiv7owdxPWrOE=0LhhMQ@mail.gmail.com>
Message-ID: <CAJKOXPfjLc7R21d2gm6fntwFks8fLNiiv7owdxPWrOE=0LhhMQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] MAINTAINERS: update my e-mail address
To:     Kamil Konieczny <k.konieczny@samsung.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 21 Nov 2019 at 18:51, Kamil Konieczny <k.konieczny@samsung.com> wrote:
>
> On 21.11.2019 06:12, Krzysztof Kozlowski wrote:
> > On Wed, 20 Nov 2019 at 21:55, Kamil Konieczny <k.konieczny@samsung.com> wrote:
> >>
> >> Update my e-mail address to @samsung.com in maintainers.
> >> Add also map in .mailmap to new e-mail.
> >>
> >> Signed-off-by: Kamil Konieczny <k.konieczny@samsung.com>
> >
> > Hi Kamil,
> >
> > To whom are you addressing it? All people are on CC so I am not sure
> > if I am the one to pick it up.
>
> Sorry, I should add Herbert in to: field,
> my e-mail is in crypto driver so I think it can go by crypto tree.

Makes sense. Thanks for clarifying. :)

Best regards,
Krzysztof
