Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 756B311E76A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 13 Dec 2019 17:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbfLMQB4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 13 Dec 2019 11:01:56 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33172 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727932AbfLMQB4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 11:01:56 -0500
Received: by mail-lj1-f195.google.com with SMTP id 21so3241915ljr.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2019 08:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5JutpvUzxOsyoaSk9NwrCbjNfxIk5I6Gyk3NK08J6cQ=;
        b=XbodqbL3vPQgnrqfzeaCyEVhD38xe5Ee/7W6WG+3H0r8d3gK1zcoVwKVXMuUgAU0M2
         4DQOvNLUDR/////SzUbHc5j5W1xWM/yBLPPmprf6fAhrBPgnVrF9MWLeN4O2vYZCJ7M1
         4X1x8Fw9FLKKsz3moE9wj1ErHuqh07bNN9CKKPgDO7bCoXbsFXdawNp+ESB1lLm7lQbR
         T7yralAgbY7NRKeWAjgOfz/kV7Au4VVQTOzHFNzsMAdqqDo6XqgWVar4MM1VmRxH+vOC
         PfeOm17pCYVt57aHpW1G40Z4N/b7GfLJcpE1D+kmru6Dz8XIukjA6/e/RZoMG8TAjDWv
         SgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5JutpvUzxOsyoaSk9NwrCbjNfxIk5I6Gyk3NK08J6cQ=;
        b=fXzXSpfqadUS3prutZpgptcPQBdkWglYIdBJz+rNAVz/bc8HF29r7rgSz+DD13HYDR
         uE7E0TjG6hbVZL4pAPJPk8hd46QFA19QGC9eg8eOe07i3xtOylCslPNx0c+L+9vIFm8d
         BrE6ahFcBUnk46jw5H1liUkbv97Iu5BIZ42eZx7vqLszDx2EyeWp0Ha/GLxJMSdg7Ans
         3IB7NPRDCvyKyJhYJpfN5d45O+V/3tKthteet7f4te2prjm+cn/HkrAuvGkp1A8+Qhdl
         xOekLU2gSbfV2D74MHl2pLgtX9JAXswEgfxYggOZ1bMhoGWJrXA+WjocDJTbKSeB2IQV
         /MFQ==
X-Gm-Message-State: APjAAAWk7evdqZPlUJ2nasO24tvwJ4HXmDEHtj/UOYI73cPjhCbp3a5h
        +ivwx2sWWojh/NCnz/6PgWMldaX70/wrAB3M6SAKIQ==
X-Google-Smtp-Source: APXvYqw5j7XQGOFi0lBLLQGKLSulok+o4hXa/wOnJ5dacau9siOORcPCGi5To+aftjmvKminoQEjm3PyKNxF1Nwhy2s=
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr9948355ljm.233.1576252914355;
 Fri, 13 Dec 2019 08:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20191209163937.8156-1-krzk@kernel.org> <20191209163937.8156-2-krzk@kernel.org>
In-Reply-To: <20191209163937.8156-2-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Dec 2019 17:01:43 +0100
Message-ID: <CACRpkdbZ8d0K08uSUhzUwnDupXX=Y+Wc+sa_etK-LnPL7RDB_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: samsung: Clarify the option titles/names
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 9, 2019 at 5:40 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> The config options toggle Samsung Exynos SoCs pinctrl drivers, not the
> driver data.  Clarify this in the option title/name and also make it
> consistent with other Samsung entries.  No functional change.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Like the other Samsung patch this doesn't apply to my tree
devel branch which is close to v5.5-rc1.

Yours,
Linus Walleij
