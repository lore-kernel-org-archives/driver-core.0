Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793652793;
	b=0otKCljwOmTcz2AYB/uCD1k8+JId6ywAOOQ1dhL7mLHP+/s2HL60uzaPCvbUvJ7L3vzJ
	 04kp0FrtfpT0degVrUjzyeYcaUYw7dn10MrV4z8ZZPU5IS+LSo+nLZyxHEvMZkFKcBGW2
	 KZrQ27wnAF3YzLQOyds+zkqA4ealaAL1KgliTvGB+SZRO/oG4WJLvLMFsq4dCWRPGT1SJ
	 HJfGw+Q6oHkEbg0iJHKTPqjNyVabcUcFllnUnrQSZ2196Q5Sih4R8w7wepKtE9z1755GY
	 4QSE26FwvemRePCOQLIn+tJ4Y//iTlTO+mAsm2QNkgvg6KUcWWxTrt9U6vQRd32z7Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652793;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Transfer-Encoding;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=IVM553yTLpVHhlr+YHaIOjh979+ErEDs3qbi3OU1CXqlawg5qFgvJUvqxCTI5lMQiP94
	 awBs9iTYVOE0l+yayeZ6IGiq7YejhnOu3bui5l25+0Poa5U9vCdykhkn1EBpi4lunt/VD
	 PHnzPWT4fjvLC9B0P8xJdJhUC9zkUFlKLWCM6Ac/SMBA7wTTCu5Dy/A2TFAPeIcWpn+LT
	 XZkZKLhF5FjndT1eCryWyhWfS2z9bHD9bhmYiLKrOa5fMo+dIy2KsoywVQJ8KFnL/PILu
	 GEeFf2N/cWAeVeyjnklFYRM6GqxGZE1ok8pgByPYpTsWiHQ/5k7MyMUYDwFTbi+BbSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrjqNRqP;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313A3606A330
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 20:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 313A3606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JrjqNRqP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793652792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
	b=JrjqNRqP10lz+xwTaT1N5hOMraQMewbNcL6ZPtYs/6qBeMDZq5lyggz1hz5TUE2wvCqKwM
	IXQbQRbVn/7mLpXXty1C0A86MwLFP717upzSrzHF5Nt1PiF43MqFrw00/Vf94oFs2+EMGE
	o+EsfhfOm9/h5ijPwHR98WSryq3gxtk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-126MggbENJSMgkkts8NQ7A-1; Mon, 02 Nov 2026 15:53:09 -0500
X-MC-Unique: 126MggbENJSMgkkts8NQ7A-1
X-Mimecast-MFC-AGG-ID: 126MggbENJSMgkkts8NQ7A_1793652788
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-3ab3061668eso242321fa.1
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 12:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793652788; x=1794257588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=117yBiLwKENKL+3PiWG/U5OMCVmGd5cgD5S+cpkVimE=;
        b=Le49wrWhXIukAuVYeKUMrEWElWoc7PpJ3hElNZFQsgKknjcAuwEQZevBFLFWbdlqXO
         SbqI953X2RFHFErC/7ilaa3WgjWDN9K4yFRaRDSLCtEBPOQ4b27fGuNyRMJDErQE5fAt
         W36ziosYX+opJmihqOqJ5ovzo6AJbvX1AxoNtQayqgAgZ0P4jCWADBVg1lhMG4KIubzr
         Dfi6GCer1IvmBt3FHcKrLsgBc1vAroal5g3Yi6y/h3H3joZ526iss9pdfb8CnUxA1/X/
         fBbCyCNiGuLWJJQ+b9bRMFYQhW02jsV5mWppNF453XWfjJdcHqbZCYvQNIJ5T3B90uzf
         f7Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwDP81dFBD8flpV1BdPrc/Lx0QfTbeaLIsy7NAGpexZqLaSNcSJ+y0HTjg2XVH6huWBOnPR57jLPDBn9A==@lists.linux.dev
X-Gm-Message-State: APuU4Z9OAex2kTlYXTzHihVAyeFSp1JuATYDzdjuf/fdshvRe0YcXF4U
	7ELxu2EzOyiBxUX7hgFVDDVsw8xY5NX7e15RTd8qBAXLsOCw8x/VvX1DOqXFhczcSwkRe91wAGQ
	1lWOhiE87ufwVR/gQ8uO+Zz9erABxyB+UmH6yu5UoKtal8V7x9UtMTudstweNO1YN7vqM3PHO2e
	WShyFv1DsRof5n4nCLfw9wCQm1oa6pUyHUjrENOKg=
X-Gm-Gg: AYBFou1XodTpb+w0/g++W70xUtnW7KWkt2JtrlfgLkD07G6gmeEJyWKv9nK5ypSIzyP
	PbLxxP44xB46ME9WgJSqeT9j0KUxg8TgKbngW+7ILL3S232m+p8MSH59UymRWb7ePOfHKmKejFs
	tlLEskz10NHGwsvG8+/muThDdC779ah1eo1PhreKYF76WKkkVfhoRB/iU1
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id 38308e7fff4ca-3acb7aa83b1mr20499321fa.13.1793652788274;
        Mon, 02 Nov 2026 12:53:08 -0800 (PST)
X-Received: by 2002:a05:651c:a14e:b0:3ac:4b79:573b with SMTP id
 38308e7fff4ca-3acb7aa83b1mr20499011fa.13.1793652787872; Mon, 02 Nov 2026
 12:53:07 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-6-irogers@google.com>
In-Reply-To: <20261027223847.652884-6-irogers@google.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 2 Nov 2026 15:52:55 -0500
X-Gm-Features: AclHuK8pGzNf4aGPekLa6NQcs521xOugw8djA3E8ZMCjZ7yn89XzG5j_wIaQNFk
Message-ID: <CAK-6q+j-MS_5St04YFU11LG_Cjf1jOuS3q33qk_iK=7TE-iuBg@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dlm: Free dlm_ls in kobject release callback
To: Ian Rogers <irogers@google.com>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, David Teigland <teigland@redhat.com>, 
	Greg Kroah-Hartman <gregkh@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lxMxohpcwsVAD7s6HHk1lTtYyHQb1ivgkblBNulXv3Y_1793652788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 27, 2026 at 6:39=E2=80=AFPM Ian Rogers <irogers@google.com> wro=
te:
>
> struct dlm_ls embeds a struct kobject (ls_kobj), but dlm_ktype lacked a
> .release callback and dlm freed the lockspace structure directly via
> kfree(ls). With CONFIG_DEBUG_KOBJECT_RELEASE=3Dy, freeing ls before the
> delayed kobject release runs causes a use-after-free, and unloading the
> module while the delayed release is pending results in an instruction
> page fault.
>
> Add a completion ls_kobj_done and dlm_ls_release() to complete it when
> the last kobject reference is dropped, waiting for it in free_lockspace()
> before kfree(ls) and in the new_lockspace() error path before module_put(=
).
> Also delete the kobject via kobject_del() before stopping dlm_recoverd
> to close the window where concurrent sysfs writes could wake the stopped
> recovery task.
>
> Fixes: 3514faca19a6 ("kobject: remove struct kobj_type from struct kset")
> Signed-off-by: Ian Rogers <irogers@google.com>

A somewhat "big change" for just a debug functionality. Althrough I
agree we shout call "kobject_del()" early to avoid additional sysfs
changes during removal.

Acked-by: Alexander Aring <aahringo@redhat.com>

Thanks.

- Alex

