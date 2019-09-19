Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF1DB79F3
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 14:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388002AbfISM7F (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 08:59:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:46928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387712AbfISM7F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 08:59:05 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 71C1E21907;
        Thu, 19 Sep 2019 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568897944;
        bh=Q8XQ7yEptEJjsrg2dRMQAh8Ewg1fi7/O+TC1/+NyGA8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=beNYs1IDfBymvGrrSglpl6q8PXqxictV6OYOE8gYvbQ85zRx4RNJaWg3gGeCnGp1f
         LK3jZRy0BUANXjWBm9PM4eTVHxeI0I2l6K9Gg3bwnrIa5WyQG6f5iIVBPQaPQDjrYl
         qJMFI/Ozb3fBpRkmZHHI+7HZX6CGH3X3sFMW2Hb0=
Received: by mail-ot1-f46.google.com with SMTP id m19so1133158otp.1;
        Thu, 19 Sep 2019 05:59:04 -0700 (PDT)
X-Gm-Message-State: APjAAAVqmvY7/mT1IyFm31oXQJXBf6wli6/k+zMvkUr2PQr4nXf0LCF5
        daKoiewI3iuR2hQt9vEpVAyy3//wod5aqqyJ2/U=
X-Google-Smtp-Source: APXvYqyPpRpHKXGqXeiUp4UsE0gjnPTa12R2JBL+9NbOd7thAIFl1MrNFlIQaRaNj/YALaGFGqmZfNIqU3lo9cSjxn8=
X-Received: by 2002:a9d:6c9a:: with SMTP id c26mr6640459otr.241.1568897943807;
 Thu, 19 Sep 2019 05:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
 <20190918104634.15216-9-s.nawrocki@samsung.com> <20190919082211.GF13195@pi3> <a0072745-f7c1-86ad-2344-d73dd210e1ad@samsung.com>
In-Reply-To: <a0072745-f7c1-86ad-2344-d73dd210e1ad@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 19 Sep 2019 14:58:51 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfwAx7vWSWS0M1JuGJvn6tKTp9yaT2qEOwmAWTUdvoptQ@mail.gmail.com>
Message-ID: <CAJKOXPfwAx7vWSWS0M1JuGJvn6tKTp9yaT2qEOwmAWTUdvoptQ@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] ASoC: samsung: arndale: Add missing OF node dereferencing
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 19 Sep 2019 at 14:49, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> On 9/19/19 10:22, Krzysztof Kozlowski wrote:
> > Wasn't this issue introduced in 5/9? It looks weird to fix it here...
>
> It has not been introduced by 5/9, the issue was there already before
> my patch, there was even no remove() callback where OF node references
> could be dropped.

I see. Then please put it as first patch. You should not mix bugfixes
with features. If mixing, be sure they can be applied before the
features.

Best regards,
Krzysztof
