Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3E4D1BE46D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Apr 2020 18:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgD2Q47 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 29 Apr 2020 12:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727062AbgD2Q47 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Apr 2020 12:56:59 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 454A0C035495
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2020 09:56:58 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id 19so2413095oiy.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Apr 2020 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jS410y1rm5OfNNRCCW0JAfor+cQs9RvCO91EhwcQ5qM=;
        b=SKEgniF11L1lsRsuok+38sxpcfheThEexuS7GTd0xZtTs01ku+ZWsyxgA+TYnf15xR
         Vnfl7IsYVhPLLkA5uNu7Zv0xrwtAGz2JCrm+/RzruMRFfOHOSVKpCWQ/d0OifaRObJT5
         4nxzQGPIoqRMiIlbx1JwzrRt7GrtyGMf0GKtxHc8g5ib5NVQAO9cB2voK5LQslsq8YLi
         jCJUlMr4swyHEuJ6y5bMN13lB2g6uOM1qk7EOLv0Rl5pzz7nairt2NamL3XXrpwV3kxw
         eQf0OmqYiXJnbW3D0j+hsYlNtUHomr6inPNZEAFtr0pmcRtmlLL9aGRrZZE3DADZjLcu
         qAhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jS410y1rm5OfNNRCCW0JAfor+cQs9RvCO91EhwcQ5qM=;
        b=P7/GQ8haFv8RtzOf51iqdOaKx1Xm9TYBkwGH/TpYyarMfPoazVwcPLYpCzX3ldiRWj
         Z1kIDQZvmFD9mZn9PehCDS7/GeYM/l1Do/RsJg3i9xfjn0/td68RUQZFVz/pVrHZAqNd
         j/G8/LXvUB7f8kwp8VrbqZXcx4NkjRybroIyfoO5gSQGhOBWJTn6lWiuxzEHzlPx8L/W
         zyf16DXskUxLfYrE7Hg5yYT+pJ092OG1P+Ku61iWj6jfVwDlIstDNZQXhAsuvvwDzW0a
         T4tCQpR/zTfYhSLEj1p+MNP445eCG7QNRlzwTGTWyZjm30NdP7cX/oUPH9RxFw7y3oJJ
         qj1g==
X-Gm-Message-State: AGi0PubLeqqi0TjeKC0XoyCxNL8tDIdBPqcOUZe9/kilCMvdalxF4wjC
        spnQiBvgwQvq17bP9mZzL7mGQW8aVHK1cIDvpsgizw==
X-Google-Smtp-Source: APiQypJWdOOaCWqMgIakohtvjOfQJ6gmQBDUoadsUDsa2Bq+T8SAlu8GGSFWb6qJ+xMUCMYQoyebcVqFRBAhUNOLfwA=
X-Received: by 2002:aca:c311:: with SMTP id t17mr2202051oif.169.1588179417419;
 Wed, 29 Apr 2020 09:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200422203245.83244-1-john.stultz@linaro.org>
 <20200422203245.83244-2-john.stultz@linaro.org> <CGME20200429134605eucas1p2bd601082e7a6b8c8fdbe79c83972e2e3@eucas1p2.samsung.com>
 <9e0501b5-c8c8-bc44-51e7-4bde2844b912@samsung.com> <20200429135228.GL4201@sirena.org.uk>
In-Reply-To: <20200429135228.GL4201@sirena.org.uk>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 29 Apr 2020 09:56:44 -0700
Message-ID: <CALAqxLWD95Ls53d+Mh2K=hn7HtTDqy2nG-APSdmwYajrw1q61Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] driver core: Revert default driver_deferred_probe_timeout
 value to 0
To:     Mark Brown <broonie@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        Jakub Kicinski <kuba@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Basil Eljuse <Basil.Eljuse@arm.com>,
        Ferry Toth <fntoth@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        netdev <netdev@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Apr 29, 2020 at 6:52 AM Mark Brown <broonie@kernel.org> wrote:
> On Wed, Apr 29, 2020 at 03:46:04PM +0200, Marek Szyprowski wrote:
> > On 22.04.2020 22:32, John Stultz wrote:
>
> > > Fixes: c8c43cee29f6 ("driver core: Fix driver_deferred_probe_check_state() logic")
> > > Signed-off-by: John Stultz <john.stultz@linaro.org>
>
> > Please also revert dca0b44957e5 "regulator: Use
> > driver_deferred_probe_timeout for regulator_init_complete_work" then,
> > because now with the default 0 timeout some regulators gets disabled
> > during boot, before their supplies gets instantiated.
>
> Yes, please - I requested this when the revert was originally proposed :(

Oh, my apologies. I misunderstood what you were suggesting earlier.
Sorry for being thick headed.

I'll spin up a revert here shortly.

thanks
-john
