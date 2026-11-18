Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035638;
	b=3Uavw7o0BsvuvRjQdeSBzkSN++x15xUSCFAQwcEApwnSMzSjpPBUIkS99TrSnP/4OJbj
	 x+DydxZ9JGw0chRh3M/sLZcCxE3NDkbCIETOkcErnpRpsqA6P/JFT6hhFXTmjLrypzLQH
	 oxdIWRuutWZMvljYp8XhVA+Dm7wrnrEE1o8EffEh9i/kATqpTyX/5bmS1jMuymVmQ+LfS
	 cYVyyXzAYxEpdZVeqtH1EMwarblCk4N4fd1RaO1pUDD1ClINQwvdeMG4jE6tzLNeUJbuA
	 kDGX1hI5m8l3ANnWR+7l2dn1+gO6mc0pyszWRTplfQv12xnRaIEzAPqPOWUjefs5BNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035638;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:References:
	 In-Reply-To;
	bh=cNfjKCcW5bwdRgISxWGphMUXRks7ftcO4FEMOzlUFSw=;
	b=PSgfByXYPmRf2BLdyAKoWjykWQQiepVbVuoapAB65Gc1Ma0YsuUT2sE/UO8Z36OCiCzB
	 TWZFmM78xdFcLMI3FkIB5OX2NZZhGRq5pHQOkykjh7pX7rst8gNJtDWUxaX6ngyhcX+UW
	 ri/XF2Zc6hs49BSTL1NvINGGlpESWq5UQz6XhGEdS+kSwSKo138JeuPLQPsBk37n8DJmV
	 yNved5FVwDG8H1+ZAbhNuO5iPo9tu143QNfDCi+/aivPERDx0HvkNKDCfbLAWNtVEGcpr
	 pdzrN9v/6L0CvHU9eGK3fMuk0LwHGYuQtqOzgHN7M/2kgVMo0BbZQmuuq1RyfmAvq2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7qxoi1T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA60606A32C;
	Wed, 18 Nov 2026 21:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l7qxoi1T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DA91F000C5;
	Wed, 18 Nov 2026 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795035637;
	bh=cNfjKCcW5bwdRgISxWGphMUXRks7ftcO4FEMOzlUFSw=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=l7qxoi1TwEhoFa0NVewAhYpoei6yWdLQ2h/GGG/oxBQ8+m1NEa4pfvDlUS9PMJtfB
	 J6AsCBGSLjyfPVSz/OSL6XhnZrs3VtOOK14hdR9vukTZ7tnP6c+jcGiL6c08p9bRY0
	 ncNr1pL9pAgm4P0ZTjg2lRWhP/c7rNvOIg6sBlO+JfP6VYjSbBt/6bbIQjz+5DqeEz
	 sIc0/TLFzxQGmbJf6uC45sP11k7c8M7iJfPH1etMYoYY1VNHXMqx3oF7sfN4k8HbY1
	 Q00lKOMTm5arJYrayzHfaUGX+5urb7E8tADy842DJmvkLCiWAtPEpQRu3OTAcO9Adi
	 bP2hio3yL2rqA==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Nov 2026 22:00:34 +0100
Message-Id: <DMYN0YFVA1Q8.6EPKUPFPHVL9@kernel.org>
To: "Ian Rogers" <irogers@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 0/9] Add __must_init and require explicit
 kobj_type::release
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Kees Cook"
 <kees@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <20261108223913.3624571-1-irogers@google.com>
 <CAP-5=fXEk-ommviDYeD6hMvsESJMHfajina4kjMw6NMuRfQmTg@mail.gmail.com>
In-Reply-To: <CAP-5=fXEk-ommviDYeD6hMvsESJMHfajina4kjMw6NMuRfQmTg@mail.gmail.com>

On Wed Nov 18, 2026 at 6:12 PM CET, Ian Rogers wrote:
> Hi Danilo,
>
> Just a quick heads-up that all three remaining subsystem ACKs have now
> arrived on the v3 thread:
>  - 2/9 (powerpc/secvar): Acked-by Madhavan Srinivasan, Reviewed-by
> Srish Srinivasan
>  - 3/9 (sh: sq): Acked-by John Paul Adrian Glaubitz
>  - 6/9 (xen/sys-hypervisor): Reviewed-by Juergen Gross
>
> v3 still applies cleanly to driver-core-next (and b4 picks up all the
> tags). Sashiko did flag more accurate Fixes: SHAs on 5/9
> (8a4cf500f1dd) and 7/9 (2e3cbf425804) =E2=80=94 happy to send a quick v4 =
with
> those and the new tags folded in if you prefer, otherwise v3 is ready
> as-is.

No need to respin for tags, but I think it would be good to respin for the =
last
patch, I will leave a comment there.

Thanks,
Danilo
