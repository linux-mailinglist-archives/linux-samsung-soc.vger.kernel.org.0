Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01EED3E2C28
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Aug 2021 16:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237077AbhHFOLH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 6 Aug 2021 10:11:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237040AbhHFOLB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 10:11:01 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121AFC0617A0
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Aug 2021 07:10:43 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t9so18178349lfc.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Aug 2021 07:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/oMubRmlLM5EZ/UdY6Fj3wsfS2kyoMzN9ASXgZ3xneY=;
        b=q3xyYt1HrVQnyL1KZndhIFKim0Z6RZXWCajZa6+jKaUt/xPBmWrU2b2TpwIqgxHoY3
         6sUeXJPoUC3zz+xqx5Y/7bh16ON7BcCcP2liy5jl/yv+hyxVGmxIcBCDJXoapuOO0RIl
         REN9Zv+ClhtVVEMybVDTEUTnyt+YraWqvgNO4CiPEvSNbjJp0ymaQzc4FwPALfOqM4La
         f+KzIMXFoGuca5XlZdCXXnnqi+xUiOGsem/cV9JUjNFonSZWOzEGazowyEr2eG3dp5DR
         pLBa7cN2FmOkeXw/dSFAaB7k29Eu0Yivashc8iQbXHlro4ZoI7aiyRP21+G8wGDlMmu6
         HPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/oMubRmlLM5EZ/UdY6Fj3wsfS2kyoMzN9ASXgZ3xneY=;
        b=J3kVrHHWZl/6zGsPJUvtsKpR1SNhV6ZrxRlbIQrdlo9O1k1ma5GTvnYvnqc9hbT4K8
         Jh88NNi3Eny/TUiD0vvOFoAURwMcvqVKmKAL9FMLHFRzlLwzQHod/s5o0VIN0haOYAWS
         07C1+iglLFnTCKd9Qo51sdqrD0MT1uAXJVEC3d1oZj5jTWdSJhTPK8YT8xD8pTqWbI6+
         k1D4za11C50DbXNJDpCK3HHE+YJz/nqfxz/TWABXTV5+15om1WPEMdS3PGpB2yR/d1lf
         8AC5KZIaj/m4kn8KfEo1gcRMBz6R64J1BCazpepI5BLO1JZQWyEVGZ8irwjsdiv8IviQ
         7trQ==
X-Gm-Message-State: AOAM532ZllXHg3m+/1gZlWD7iUozuRPza5+CF25ccyq5tEwqJM3pQIcy
        +SZbYHQUyf51XjiSZtpBw5pTrfnIBowYrRKcglWGJr6ZGyonJdiG7A==
X-Google-Smtp-Source: ABdhPJx229jhz+o+nQwdgIkoqR5HwLh3S4+JGHt0eG+5fB4X3WTmNmInTj1ZpuXDIVm9CYEhhFZzLyuZYbLrplGdX6A=
X-Received: by 2002:a05:6402:3094:: with SMTP id de20mr13526197edb.272.1628259031175;
 Fri, 06 Aug 2021 07:10:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a54:26cf:0:0:0:0:0 with HTTP; Fri, 6 Aug 2021 07:10:30 -0700 (PDT)
Reply-To: mrmaxwellwatford@gmail.com
From:   Maxwell Watford <orchowskiruthi@gmail.com>
Date:   Fri, 6 Aug 2021 14:10:30 +0000
Message-ID: <CA+q9Q6OJB6Z0+y=5_3MBDNGkAUG9rVxg7bZVma38uDOvJ+sOGw@mail.gmail.com>
Subject: i need your reply
To:     orchowskiruthi@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Greetings,

We are writing to you from Ecowas Finance Controller Office Lome Togo,
because we have received a file from the Ministry of Finance Lome-
Togo, concerning an Inherited Fund bearing your name on it, And after
our verifications, we found out that the funds belong to you.

It has been awarded and I will like to guide you to claim the funds.
Please contact me at my private email address
(mrmaxwellwatford@gmail.com) for more information and directive

I am looking forward to your urgent reply,
Best regards
Mr Maxwell Watford
