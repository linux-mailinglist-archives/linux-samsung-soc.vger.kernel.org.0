Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE8665798E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Jun 2019 04:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727294AbfF0CeD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Jun 2019 22:34:03 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45880 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727193AbfF0CeC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jun 2019 22:34:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id m23so617878lje.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2019 19:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YfeVGiINGvcAL0ylcIiHvWlPZAP7LI/BWFr7j7u+Ma8=;
        b=sAfqDvGMAcNLiFr36fLugkcYKTHTYqWGqR+DQH4MoHxYQay0f3uqvRcAG5APx+IHyk
         w1xSZLlLM0yaMsIrS7gfZM3FsTGTYVNyKaUMpnMspaRbpwpSc1P3rftfh11sTf3ko0JR
         dy4up0doEZpK5BGyCa4P4xssnDTwhbSR0KRdwJromVUxKLK/x3CCof7M3jKz4AHdKZfj
         YokdCmbzbQKUMLm2w6xj3hMiAYn8aw0zjSnQ2JxSM7QWpqZWQmUS0Ulqe8bV3f8mLQkL
         J2Wlz842sGj602Acn+0iV2uDg1jmTQ6XJ7Re60v2onqcugRBmiSGLpIVBlfXd3eWi0TF
         h+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YfeVGiINGvcAL0ylcIiHvWlPZAP7LI/BWFr7j7u+Ma8=;
        b=coBq3fSjux9AwNWU6lT43HzC6J3OFZwkMW6PTqDRsgQNKpAg7jWKsJj24n8LVP32zs
         lK1dsRBd+M5QAYqS+xQPEBkTdVOCbBfyfWVBbJTVICgp/KShFFfYnaFNBKiaHWu3rbAu
         ee3FhadHfs/1XDXbjSINO9PT0jEPgAIZ0UmPe6zECnTJrKUbkD1bwvB0gXlcxruKXHWm
         9g3EC2yUPCN2LLdVuJwCif17qzSk54toqPE6yyh6pb45XZvTa+z+19vfei5CMcvm18bR
         if2V064QBaqquPWMK+thWvVzxP5ue4DWvTBp5nB5HBPGOGCJk3VAriUh/EzAvCaiAeMg
         Vq0Q==
X-Gm-Message-State: APjAAAVu317YtTxcocrwKUxUHl0JlFGHntsRHM+IkTxg0zHaljsFv6JB
        vswTDD2pldwBCt4NkgYX+WgZug==
X-Google-Smtp-Source: APXvYqwZ7Y+xuY7WVTjN9K0TZJUIVEdEoWWFv6u/0pgw4bKbyu+FElNlkWjxmys8iw+aEojM9sjLvQ==
X-Received: by 2002:a2e:5c88:: with SMTP id q130mr913537ljb.176.1561602840483;
        Wed, 26 Jun 2019 19:34:00 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id 25sm106720ljn.62.2019.06.26.19.33.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2019 19:33:59 -0700 (PDT)
Date:   Wed, 26 Jun 2019 19:28:42 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL 1/4] ARM: defconfig: Samsung/Exynos for v5.3
Message-ID: <20190627022842.k4gccn6enqd75ufs@localhost>
References: <20190625193451.7696-1-krzk@kernel.org>
 <CAJKOXPeCQZPsF1kGKmhSWgxsWSsb4cre6mhS=n=kJbH63LjmUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPeCQZPsF1kGKmhSWgxsWSsb4cre6mhS=n=kJbH63LjmUQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jun 26, 2019 at 11:14:04AM +0200, Krzysztof Kozlowski wrote:
> On Tue, 25 Jun 2019 at 21:35, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> >
> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> >
> > are available in the Git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-5.3
> >
> > for you to fetch changes up to dd50a69b5697532666023766688c6ea642e5a443:
> >
> >   ARM: exynos_defconfig: Enable Panfrost and Lima drivers (2019-06-19 19:23:35 +0200)
> >
> > ----------------------------------------------------------------
> > Samsung defconfig changes for v5.3
> >
> > 1. Trim several configs with savedefconfig.
> > 2. Enable Lima and Panfrost drivers for Mali GPU.
> 
> Hi,
> 
> I forgot to mention possible merge conflicts (although Stephen Cc-ed
> you on mails). Resolution is to accept both sides:
> 

Some of this could have been avoided by basing your branch on our fixes, but
not a big deal in this case. Thanks for the heads up!


-Olof
