Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C41BAED1A
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 10 Sep 2019 16:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727415AbfIJOet (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 10 Sep 2019 10:34:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:52186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726132AbfIJOet (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Sep 2019 10:34:49 -0400
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2615321479
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Sep 2019 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568126088;
        bh=N9yEku3TkTccdcq4LDJA9znsoT5Phes4V2eVsDC3pkI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rNf0W3HdWezzXYc6WCfSSy27oJ+Nizwu+cDjjE2b692DxTjr9hi6tFN1Av1CQj1FE
         E6MvjzAnpBtJ6uQ/0EZNITH/3gUZlYUrvriCMVxwfnF7Yi1DPoOTaoQAQFjjieTSw1
         YXqlOo0PBoqYEHQ1DMGafFJdaGB//Ip+6esSwoDE=
Received: by mail-lf1-f52.google.com with SMTP id j4so13641550lfh.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Sep 2019 07:34:48 -0700 (PDT)
X-Gm-Message-State: APjAAAWlfmnmv6nLc32nXqGHwDJ27GrmHcrhO2IJXBRqF5CqzKpNP7DC
        anVHG6B/zbP7AGfCMdAEbCZstxCfNW3UaJouahI=
X-Google-Smtp-Source: APXvYqwTxGoCSMY2hh0S4X+P7RznBzUvgDPCYT6mO8bQK3CwgOEn1aV209aKXhdq5c95WjWG4zmQiOwrHX5Gzg1E2w0=
X-Received: by 2002:a19:770a:: with SMTP id s10mr3174092lfc.30.1568126086301;
 Tue, 10 Sep 2019 07:34:46 -0700 (PDT)
MIME-Version: 1.0
References: <BY5PR12MB3699A8D741EF6226B8DB65E4C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
 <20190909184504.GA10091@kozik-lap> <BY5PR12MB36991B9B4E33B2A3093132BCC4B60@BY5PR12MB3699.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB36991B9B4E33B2A3093132BCC4B60@BY5PR12MB3699.namprd12.prod.outlook.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 10 Sep 2019 16:34:35 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdJnXP8t-E4aWcnxRNykkULYfFUyC9173SKepQ8z+ykCQ@mail.gmail.com>
Message-ID: <CAJKOXPdJnXP8t-E4aWcnxRNykkULYfFUyC9173SKepQ8z+ykCQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix init order of S3C64xx's clock providers
To:     Lihua Yao <ylhuajnu@outlook.com>
Cc:     "kgene@kernel.org" <kgene@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 10 Sep 2019 at 14:56, Lihua Yao <ylhuajnu@outlook.com> wrote:
>
> Hi  Krzysztof=EF=BC=8C
>
> On 10/9/2019 2:45 AM, krzk@kernel.org wrote:
>
> On Sat, Sep 07, 2019 at 02:47:48AM +0000, Yao Lihua wrote:
>
> From: Lihua Yao <ylhuajnu@outlook.com>
>
> Ensure fin_pll is initialized before clock-controller@7e00f000 so
> we have correct clock frequency like below:
>
> [    0.000000] S3C6410 clocks: apll =3D 532000000, mpll =3D 532000000
> [    0.000000]  epll =3D 24000000, arm_clk =3D 532000000
>
> Hi,
>
> Unfortunately your patches missed the samsung-soc mailing list:
> https://www.spinics.net/lists/linux-samsung-soc/
>
> Maybe you need to be subscribed?
>
> In general, if the patches are not there, I do not see them under
> Patchwork. You miss also review from Samsung folks.
>
> I had tried subscribing mail list but got rejected by vger.kernel.org.
>
>   majordomo@vger.kernel.org
>   vger.kernel.org
>   Remote Server returned '553 5.7.1 Hello [40.92.11.38], for your MAIL FR=
OM address <ylhuajnu@outlook.com> policy analysis reported:   Your address =
is not liked source for email'
>
> I had used my @163.com email too but got nothing. I couldn't use gmail
> as google's services are blocked from china mainland.
>
> Would you kindly recommend some email servers that vger.kernel.org is
> happy to accept?

Indeed outlook.com seems to be blocked. I do not know what other
services are accepted. There are many China-based developers and
somehow they are able to send to LKML.

Best regards,
Krzysztof
