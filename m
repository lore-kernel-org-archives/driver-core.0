Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC211E0DE8
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792013942; cv=pass; b=cFZh2p6y5ctxZn7BE8chrJGzUu7kJx6QtYD7I5VwU+2XUj2Rg+QbkaJqDVzHxWlMnk9Js/DpInzONz++wW0rIE1I+T8WjtRbwCWZSzh7LFmq6B1bfDvrgY06MY3fplWVFD5Nv09GoW97M63f5JEhXLAF/LKM+mJtQWSbM8VWbLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792013942; c=relaxed/simple;
	bh=6fysRVISsRCgSjjNd6NMwPvN9Unra7OKnoCFbNYCDUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YW/+fzy5+6vOCAZijVyb6myIorbZqsEK4wW8857EojW//FluN9qhgjUJa4/khe/gM2VPRhj/mNIz3lfZ+3EWcGusp9G8ARUqmilaDEaLgubgifLIMMwVa2Rq0BXdQ5HO0gOxCGzSCTAhO6L83PFfOU2gUTb6rj+SwJVJfQNJGsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu; spf=pass smtp.mailfrom=uci.edu; dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b=JYwF3W8p; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.b="JYwF3W8p"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91b55859245so69179276d6.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:39:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792013940; cv=none;
        d=google.com; s=arc-20260327;
        b=i/fCd4vZyMbEsQ5ROuD2JuQ8X01E63Xbc02YW7Kn86/tyrPHCHd11O4tHFTyBGEbRk
         otBsp2pAggHw1iXH58T/kuQLm8ftWRZicYCSzO+IxOLM+AMJAShcLP59Wj3PIK5YftUC
         +sJKYG3Dcd/uN17AQ3/TyMOsIMxvKYJJhY07xxVlJmMtom2mIr4VtHbpFoipW2MvEsfx
         xb2s8Cd0et3srozYeuRDL+e1fMJkKopwDgVUHE4gAt2Qiem7oFRRpkNVp2E+v9oyKEy2
         gW+xPcpVUhdB01scNDLqt/kC4j4sxRPKf2RAQW/dIilyW4bD42ZN49mcB2S0zvQ21wX7
         QA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6fysRVISsRCgSjjNd6NMwPvN9Unra7OKnoCFbNYCDUs=;
        fh=Mdp+sf+RrJ1yAvzGYTkaXw/ep0c6RiCzY/5vPHxNTko=;
        b=E+dziGdB5MVsbIItXgLKlDVUJIjLBrgYkYKLYuFvUiFT0WrcnBbbLmrtScMbyZl2J4
         5qGFKCOuZZcdWyxZnHSzuQYs1rVzeyAvOmYF7743ugqHUItYEs2vIkSecYn+BCw9ksnS
         BXWNWnDk12ipM38jw0n5fZiTwoyxdjHMq+NRn1dv4b7FIYKJn5AY8Ul+YnSSqAW1F/o0
         MlJk70xNUm4XoFB9PeHbMiYjhZBhH7n4p5P2q+f2zrwdXY6qgBO5H9M884SR6iu8dfTD
         ZNV/ZDupfxOgYxAwGLbo+RwRTGO/9b+aiU7h4DXq+NQ54I8x1lMKIB2enGtEvfcoVP69
         gC5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1792013940; x=1792618740; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6fysRVISsRCgSjjNd6NMwPvN9Unra7OKnoCFbNYCDUs=;
        b=JYwF3W8pQHhORaLRS/jAuZLr5/G22WBxnsD9PIaJAR3RfUDgp/a1DXhDkZKi+HYM3A
         8RVea69a2NzOzoE69WaH5zepq2k7jdRQjD2jTfrEM6xZs5YPqTVJPg4PL60SLfWdO4Kl
         2lR1OlMjpE3KMhxowyaH6cIkSgpvdKtSw3AV7fpzxCrLmMxMENdL3dhUhgeuHQV+QlWL
         9KGtGbxthGMOlxqoTuxiomCas/rQPYcqtmjFlx1IZn3MeTni9CCz0dbqM2dlIxwUYG/g
         Cpzf5hdBrV/8gyqlNnLMUzKv+5CZz6xizGTnK4OXHDmyDsMZoNznHjNavhSi0nuEdIgp
         NjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792013940; x=1792618740;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6fysRVISsRCgSjjNd6NMwPvN9Unra7OKnoCFbNYCDUs=;
        b=mC9pt5skEBo4C0Z5advUFkg+aNA24GQ5+jn97ZuCyQzdgg4kBcpMYfydnQ8xLqec+E
         BsCxYQ03TFdkpeCZcMuJ98DViRZtDLKnoFz3h3GT/Ehb+qLBAr4WfG2eszJvvo3IhEMe
         2iFAlkCHwVPyvqxYgJk8l3w9Zh3lf/INEXe6hLcDm+RLWw6Uu/3v3mLEIXG7d6R9mnaG
         j9EXGk87VljWKxnfqxol6eLXAdQeTxtC/boWZvvF1VLY/boUMYYxPhQzXy6cM8M8K2BS
         ul0UzduihWAUMfKla8aAFp5ZN4VPWDaLTbV7yTAdYSOAViealLEIavbkgtmDVye8G4Va
         70og==
X-Forwarded-Encrypted: i=1; AKwUvBwlDvfDaH1hdo0gCwF4RoO1wb31l7egpHxci+brHSrqnUm8tmbgakgNH56wS7T9C/8+7rK70ucxgnTUcg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIsn7Z5wCK9xv+nj5ve2ZOpv7BCuzlsaORVb2xG9/jM0p1nGw6c
	dKJCjZXKZ/GFBTfAQj0PzI99o4VvJ92x5F2EqsBTitK2v87AyjT9sWapGClTgFazmnzjKHD8CY2
	274pBOow7Q5sRq6UPwHNbylYmIdDDtgpmw6zSyY0Ntw==
X-Gm-Gg: AYBFou09mhQ1PyRWypDDkKpPIpJDBJlV0VSbztpuiNeluA39m0DUqMayBs8Upmzhi/8
	ym+MtjtojIFpX5q5IPjvrQVBd/EyYJGViMld8EIu+ztlFh1nqYQi8L4AAyn48E0LZDU8CDVNEVz
	HA08X+lqV5GrNnxubm7kntq0buFymdCGNJ5j7Nxs+tj8cNBkrR9mAlToIE/u2zEvlWtRZptGM8Y
	5LoPhAsJciumN99r7S24uOwNaaQjI/Peo22iY9LxxdZAhSra9NQI5XIOR27iU+jpzIGykMLu+FM
	vdLC6McG5ofMcTjUMpWCyCbNz2R0FG5ENd5cQMYF6+nC7W7F+mD1Z3LPTt9s4b7427FaaQaKwfO
	OvCXee2f4m6lZqt/I9/+SJg==
X-Received: by 2002:a05:6214:194b:b0:919:85a3:313e with SMTP id
 6a1803df08f44-91b554c3f01mr295872726d6.17.1792013940227; Wed, 14 Oct 2026
 14:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1788901318.git.pgovind2@uci.edu> <a71c5593cfc66e21f24d9c07ae3469fc4f8ea501.1788901318.git.pgovind2@uci.edu>
 <DLSX1QUUMSA4.C3YJIVTOC2P7@kernel.org>
In-Reply-To: <DLSX1QUUMSA4.C3YJIVTOC2P7@kernel.org>
From: Priya Bala Govindasamy <pgovind2@uci.edu>
Date: Wed, 14 Oct 2026 14:38:48 -0700
X-Gm-Features: AclHuK-ZW6mE8FMgFPO0YwD_SeSPs7s8O5ZA8QoUSzDP1KeSMhZFfV5SP2KjBD4
Message-ID: <CAPPBnEYqVDHVonzRwMAvOjVfrTmjXQD7=v6LnP4EknxPOZjt0w@mail.gmail.com>
Subject: Re: [PATCH 1/1] rust: io: Fix `Region::drop` releasing nested
 resources from the wrong parent
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, daniel.almeida@collabora.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, me@kloenk.dev, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, ardalan@uci.edu, 
	zhiyunq@cs.ucr.edu, dzueck@uci.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for your feedback. We will address this issue in the v2 patch.

Best regards,
Priya

On Wed, Sep 30, 2026 at 12:59=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Tue Sep 29, 2026 at 7:46 PM CEST, Priya Bala Govindasamy wrote:
> > Fix this by storing a reference to the parent resource in `Region`.
> > This ensures that the parent remains valid for the lifetime of the
> > child region.
>
> I Sashiko has a valid concern:
>
> https://urldefense.com/v3/__https://sashiko.dev/*/patchset/20260929174612=
.Jss-fw-sa4kdEy7Hk2_uC8PLsUpZ-K_gGWyuz4Qc6_k*40z__;IyU!!CzAuKJ42GuquVTTmVmP=
ViYEvSg!KWKxj1WyZCEbpDclCnamJVxSVUhhlXJiX_-xnNZOlZ5TtGiUySSQ33XIkL3Id53pEUt=
CiRwIGz4VqQ$
