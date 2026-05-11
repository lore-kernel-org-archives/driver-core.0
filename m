Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D03A0B3F
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532295; cv=pass; b=XCeI7lXmiO4TPjPG9GiN2AsNBUJ2oBHhrFHSUe1nR9aLwvlpD/fNGYB9WhTD1uvrY4RqJMT5mFQZvxa2E8g64Z4fQvNk2B94fTdAFxtTUNNXYIEgJ+NBxEXDNXgJYU4EUfn6Y/fMEKtlOqjgPrePVu3s19cY7jFO2z+N3i0VSaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532295; c=relaxed/simple;
	bh=Lsx7HNxS24AkVUOKYhryh8TJ0MlTzkkNg4zqi1eTIJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vz0Z3qsgHVVzlkGX0LcsfUb8FsSTd7cO3atHwDpZOr5+RYOO11dztHLoHh89v0Z/7+VtUe5H7wtMJbSFDYoXNDvhh+2tE/1+rndKi2/nKtM5ydT4/jkTskrzNpHsbRLowaup8JqIKlyvMTiEQFRSLLG+On8JQLrO8KNxud2nXzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVLWm9wC; arc=pass smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVLWm9wC"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so56804365e9.0
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 13:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778532292; cv=none;
        d=google.com; s=arc-20240605;
        b=ecMtZt0ACZwBC06723JuD6ryE5EvssEf+6nEDShc3vlGPkK7hrmYKELQFecmB6AGag
         ViKPLLp4IuPqk7a0KtaVy5wEvU030UJeophN4JSzdrS4Ed/lQ4uzb5x2B2lHB5HkBPZV
         CAPo0HBAYQaHUyqpH/bD5AdtraX9MHfYBahSLIE+D1IXPl/plleNWGKYT+tBqrzWOmTI
         qyhnKX8UVerobjBIYDv2TYq7lR4Ka6Gi063KcTF1y7ELFXYuJHDtXciW5QGPTcm1keKC
         gi+cAnJDp9Trwte31psjKXJ0QkvEhav7aAYHJrQZsus/YBUS1Bun9PsB/SKAK//mpcdy
         evew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HxXhE1E3zIMNXAZQMW7578XkRyn0VMcl/G/klUEmemo=;
        fh=LqL+OEkF2j0Z0nqowez5o6ztQ3DpfxaHRcwdukD6/xg=;
        b=hInricbBAx/qkk+iNK8DyrzHkx/eVdNnr8tZ9KkjxW4DkrtMXZEIiyu36NPKqJ51Y5
         T6ODC21QjP+C96f72rESRvXqeQTQxZPgVhqF/hjUezRcgyGcGBXZnxBLRlUjDyHA8toE
         ZPaFPBmU6Gw4OQDOwZtNR9VTgYnpFDEsMdwBnqA5y6QY9mUNofTyfSkbvGcTZoafRk+I
         Y9hFtgnieSNQ3RvlklrrLnEJJB+0/PE8h+OQW6pHqTlZFD1pC81IxbExPxQAhtPAed8Z
         IFtLmk9gqBYqoSTgGBtrFVl1bJj4kRnLjZZ25lurQIgUK1C2jXN7mxRoZtTVK9kS4Cr6
         B/yQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778532292; x=1779137092; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HxXhE1E3zIMNXAZQMW7578XkRyn0VMcl/G/klUEmemo=;
        b=OVLWm9wCWd315oNZly8xU2qca6Kcko8n6BbXhKBOKMvRwq9WtMxIy02ZiK1eR39Tm5
         X/xypOBp0r2axt4uOxfVi/sZ53v8vZm01GiycbC6npsMzSEs8m+znJB0Bjruwk5Y5RL9
         z8Ef6dLuHo/JEDZousIGRa/8yVOzusYlTK5l+kLQNsqPtFAEO07DhcSHQceZ+lkpAo0f
         TAJDiO2l+rCyuvoWt3u7eU8S4zBqX+SukWg5oCaONssBvboHapWYzHA3lOWwxJ5CabkZ
         K5mZJa29HTw1ZUwVU2Bqm2ZNiteRmvUQn7opLcsDk1fW0WkFee5+0TAU9afDuOfhSnO/
         fgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778532292; x=1779137092;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxXhE1E3zIMNXAZQMW7578XkRyn0VMcl/G/klUEmemo=;
        b=naRc1TZYLT1mOBum8Qp3UesEiR0yVwuk+xMxXN2OBQftysa5ONhGgwANgOn0rgvRA/
         tcKC0EHQ27BvUbEpu822RdMF8RyES4Hn+fa1a97V7Qrkx8LZJaU8HRejGDUZJx7UFvRP
         fxnLEjjXd8td/ZuwoJUgbIFVNv2pZJmJvIdCbk21/3Py89IEWr1HhqxfAGrqot8vg0qD
         oluFev2GUtT2HXuj2F3QCIogYgt/QU5Av0Lj3BXicNtbVbaRJyUKAh8a4/xMTAH6npnw
         TvkFEMp++Rg30vFtJBhj7d+IfZjU+QQ7ktc5IMuWGIGGAKzF9i6K2GU4FCxzI3jg0AFb
         zMHg==
X-Forwarded-Encrypted: i=1; AFNElJ8H30H08hSbpmV0IHqtPRQMXoTsHNXZ0WQDTgxz9LZ0eqZi92NPU4B1qzSyNhEj1qqX7iXDdTHt5XbomQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOvsBYRCfyyyJNFwrX3t8IkKaFYOCN6HHzvAbxzXMI6pjHeXw6
	EuRUuXGFkN2tJNdhp1HPq8bq0C30l4Us6WJlFrhzuBEPMILkBRSw3Sn5qjUbwj77kLB2+du7xTr
	jHME6A/uztHS27JbOvLiT8MQjlcjFthE=
X-Gm-Gg: Acq92OEE0Ey56h3j+1bbM3gfPB9S+onw6ykSZoS2P7G0AyART4exJyO1s5iF/lCTlxX
	stQsBgnmS1ZtoVbpg3q9zs9zGMnuGjK2twD9zIIbuAgYHUGC+Fn+kGz0hM1EbF3hZrgtYlFjbGt
	epWOsPTP1k8NIg5qucCmnuDmMrWkOf3Em1N/Luh1ETlOgP8JP/TNk38p5GJxYIqcqSic9cojVVS
	027bhEJaRDPm24bbTIBGcXEy8vzcPpcRN/eBSbbu7T16aQHtOVaR0vNtl+7uYAcf2K23KBoZ501
	QNfTUCpWx9C/E800gZi+y+nzaFiztR2nmIKUw50b+lyY8jnvX9nL7jHgk/1KLmRt0Zq86FWg3op
	9BYyhlQIxrjePcMMrV04r19WpQ0vSapm1RFTDypZ6n9mlRbNpU6+Z7idAbg==
X-Received: by 2002:a05:600c:34cd:b0:489:1c5f:3a9e with SMTP id
 5b1f17b1804b1-48e706f3688mr182545995e9.13.1778532291754; Mon, 11 May 2026
 13:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511174559.659782-1-wusamuel@google.com>
In-Reply-To: <20260511174559.659782-1-wusamuel@google.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Mon, 11 May 2026 22:44:15 +0200
X-Gm-Features: AVHnY4LE3o2vqBaZVgI10g6eDtVh6QEf9MBs5iW-S47AwW-UDvT4urkZRxmTfSI
Message-ID: <CAP01T74KQ6bie5o++i_gHM19J+s2RzDyM6=w87=oUZgPagPejw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Support BPF traversal of wakeup sources
To: Samuel Wu <wusamuel@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 19:50, Samuel Wu <wusamuel@google.com> wrote:
>
> This patchset adds requisite kfuncs for BPF programs to safely traverse
> wakeup_sources, and puts a config flag around the sysfs interface.
>
> Currently, a traversal of wakeup sources require going through
> /sys/class/wakeup/* or /d/wakeup_sources/*. The repeated syscalls to query
> sysfs is inefficient, as there can be hundreds of wakeup_sources, with each
> wakeup source also having multiple attributes. debugfs is unstable and
> insecure.
>
> Adding kfuncs to lock/unlock wakeup sources allows BPF program to safely
> traverse the wakeup sources list, and a kfunc to get head of wakeup
> sources list is needed to start traversing the list.
>
> On a quiescent Pixel 6 traversing 150 wakeup_sources, I am seeing ~34x
> speedup (sampled 75 times in table below). For a device under load, the
> speedup is greater.
> +-------+----+----------+----------+
> |       | n  | AVG (ms) | STD (ms) |
> +-------+----+----------+----------+
> | sysfs | 75 | 44.9     | 12.6     |
> +-------+----+----------+----------+
> | BPF   | 75 | 1.3      | 0.7      |
> +-------+----+----------+----------+
>
> The initial attempts for BPF traversal of wakeup_sources was with BPF
> iterators [1]. However, BPF already allows for traversing of a simple list
> with bpf_for(), and this current patchset has the added benefit of being
> ~2-3x more performant than BPF iterators.

This looks good to me, you can add for the set:
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>
> [...]
