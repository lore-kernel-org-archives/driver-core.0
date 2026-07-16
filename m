Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D045F2989B0
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 05:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784178071; cv=pass; b=rJ0i+A/e2EE1qAxP6C/LJw6KWQ5nhPARrNRz6AKEZNZRWupn7vLQ2IfqfsUQAFPzqNEEYnH0Rb3VrS/D+h3MdrNDxODIcqdOkU1QY4gIjOOWYeqxmCOLg5+uw2AJRCVCcYhBDnnDREpHU8g/KKqiQc0An3+d6G7CmJ6LQ3yX1tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784178071; c=relaxed/simple;
	bh=IHDO4pfQ1RwtqxE6jXQnDmb8Q83xXvkBKahrI0yFd0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afpMBq09afmRhJpgQdlENNGcG+YcQd08zj/OYmL0v3Ytn4kQDu+tyBXNpwhOHx2NWP6/Eoie25MNGcV1gMjaTQhVFMJumeSn+Tj5vUczovRrJKC6WM+G+PK7uxFwg2TY8/8jRZeCO+UNcu4pPQF/+onZCpRFeFQKQVPQDfVLlVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JCpL5FqI; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JCpL5FqI"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6679d88abdcso3241937d50.2
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 22:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784178069; cv=none;
        d=google.com; s=arc-20260327;
        b=iVwGXcLfzJxM7OMeObeRAcLsD5kWx4rNDjrtULA0dylYvGkLx8Jqgyjx7m0B2vx96P
         KeoLDRZD6kVRpJ2WodvxQjZNTeBaBuqZxLsYeOFzBvSzvi1Qh4cf+u6OXa731O7Mvz8l
         QoPFGxB8orvR0nqRtioSeCG7FKLtJgkiqyAH5VXSTEbPDdfnU8glBHxeScC0WFi4zh1q
         u8HTKTmeB/ylvybCGKBP0TJKDuIG66gTViF2cNV1jlSBdhd7wUKoI8op+3f0flrhFYhU
         xFxeyMxOFZDH98/ZMG9Jtzpe8dTUQtXUtPPMHPqtXTU7us5tLuHoP/qAeBbaCp/F7DI1
         tijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        fh=JhUSwvrzi0cD0WzZqmwOnUI1fXk+yp1B+AfGrZ/8xHw=;
        b=QnIBDEZYmYy8Q4QKGsm0NcDM/IL37o9TMQXq2DWzWCON4GEKO297+pJ34FlxtmGVTF
         HOeNo/OHRr0OAQJy6nKL7hvmsAbmuTq34WbfobNP6hUwAnizsH2nb6io5SkSV8v0BZOd
         UFuOEqg9ABs0ssnrfIQVCvKW1ftFrISb8tHi3wdrKzsve+bp9LDi2Rrvy+4ILr2PvtKm
         K3Ma3XBos4FrEmuLw+3xLJViJc/XTUqam9EWJE9M6/Pirm+d//NEQfEP+eVRqvVIWatS
         rE9D2mSailcElr1CFO5qQotZy3uaF9mfJPF1qDZKm/xSpWnqdfHQirn249+TWAeXHjaY
         giyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784178069; x=1784782869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        b=JCpL5FqIgy+c+p5W8Zeq3PlZYJ7rkniQMgDs2GUFgFfaiROQUblF1/FJ+rni3VYJJQ
         3YuiveQ+BxA8Z1oSdQcuDfkT6hCJxX3gp9CGrPr0ZMsXnSMu0EHxy6CVA1M1hHa2ai+g
         pgsAEcC78d+QhEKzB8A3Wh5sJDavBDtc9TTmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784178069; x=1784782869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1BOXU1ObI+PFUCX17oIQNJoe6CKqml9x7GPGmHcf1jM=;
        b=J8k627fDAzErwI0Hiufs5i2CtorH7/V5/k0g0LfIi1+OIe4SBoRyB9RBFyNGRtyNEi
         xT+ukZ4Qy3UFeMm4IaxdEafFjzN9Cu9wqKQzkyVq7YJZne0HoIkcF1wAq7UsorMpP86v
         4N/s5DfnP41sdTfl9kZ76MYaLGCf49W2KetX5Pt20bNMTsFwketkGZ0TglLk6te1VO2a
         DY0OfMJskrprkZF5AJ2M8CONk3mV8FFWr+QVERqi1g67oF5rdYt1TP0q9g9ur7Y+442g
         M6XBbz0Cg+1GE7j5qPYi8uYspVU/D0gk2jTH3cB2/j9sABBaRJS4Eu2GkVBee/oqY/iI
         7Jew==
X-Forwarded-Encrypted: i=1; AHgh+RrbRKCao0Ut2PKycUPai0s4yrjfaFYQA5FUSDvJykmFC67JFVTey5SGYW4yh4AphBqYesy3SQ4LhzF/Aw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFvcoxGHMJ98A7gXnvSLFx5HCoE+0VFusFmU0q/+INzNsl7UzY
	lC1ZwlR4MRa9bWjVRSWjqXvxzBMGQ704TtdQ4F1GmYm852HZrwgwoCuWpBDp7ULbHPHexS62YTe
	ClsVH+LbKFl5qm4vdQoZ5Q94PHZqnp+nbGKuwgY57
X-Gm-Gg: AfdE7cns8CQOpbzUjDrSfps+5sWkjN89rvUiyao2z16a9kRYSQQk+CbTZDgzcqYCeJi
	rbJUF+79z406kXOag2wMSNwnXJ6Vc5vKZS4efzyjvhYMfh+mfUUS+ps++8u3Lgr2tXgoijDkvy0
	QKBcJY8YwHE/uKV42snZz9Nb+TQTrv6Kygn27XWmZe3TjpB/39/X0chmUaqGbzG/UqPg/7Z+In+
	ER4sCdC4PoYiW+jTOgH5FkFQbyDQF9+blulENte7l5pefROfo8hkZAsuSxpM7NFhzi2YUv87Pls
	99BowJNt3zFqKqvQ
X-Received: by 2002:a05:690e:b8b:b0:668:2b54:8cf4 with SMTP id
 956f58d0204a3-6682b5495a1mr520495d50.72.1784178068705; Wed, 15 Jul 2026
 22:01:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-2-wenst@chromium.org>
 <20260715090310.26F5F1F000E9@smtp.kernel.org>
In-Reply-To: <20260715090310.26F5F1F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 13:00:57 +0800
X-Gm-Features: AUfX_myRAMngI7RW0JtHLajnxuyPdfwVsueSic_78CnabftGnuXr_AHxR2Pwgj4
Message-ID: <CAGXv+5HQ68BPzu-G8FHoEpFyncd_78VJCTm3vNDBQPsomX4H7g@mail.gmail.com>
Subject: Re: [PATCH v5 01/16] device property: Add fwnode_graph_get_port_by_id()
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 5:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch adds two conflicting declarations for `fwnode_graph_get=
_port_by_id` in `include/linux/property.h`, which will break the build.
> --
>
> --- Patch [1]: [PATCH v5 01/16] device property: Add fwnode_graph_get_por=
t_by_id() ---
> commit 88979df4c2fc6de15d7726e00adc783bff896bbd
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> device property: Add fwnode_graph_get_port_by_id()
>
> This commit introduces a helper function to retrieve a reference to a por=
t
> firmware node by its ID. It includes a flags parameter to allow callers t=
o
> specify whether incomplete ports should be returned.
>
> [ ... ]
> > diff --git a/include/linux/property.h b/include/linux/property.h
> > index 14c304db46648..480ba8646bcc8 100644
> > --- a/include/linux/property.h
> > +++ b/include/linux/property.h
> > @@ -505,6 +505,9 @@ int fwnode_get_phy_mode(const struct fwnode_handle =
*fwnode);
> >
> >  void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
> >
> > +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle=
 *fwnode, u32 id);
> > +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle=
 *fwnode, u32 id,
> > +                                               unsigned long flags);
>
> [Severity: Low]
> Does this cause a build failure? It looks like there are two conflicting
> declarations for fwnode_graph_get_port_by_id() with different signatures.
> Since C doesn't support function overloading, will this result in a
> 'conflicting types' compilation error when the header is included?

Indeed. I squashed the header change into the wrong patch.
